'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { useRouter, usePathname } from 'next/navigation';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { 
  faUser, 
  faDatabase, 
  faIdCard, 
  faKey, 
  faFileLines, 
  faShieldHalved, 
  faSignOutAlt 
} from '@fortawesome/free-solid-svg-icons';
import { clearAuth, getUsername, getRole, isAdmin } from '@/lib/auth';

export default function Navigation() {
  const router = useRouter();
  const pathname = usePathname();
  const [username, setUsername] = useState<string | null>(null);
  const [role, setRole] = useState<string | null>(null);
  const [showAdminLinks, setShowAdminLinks] = useState(false);
  const [timeLeft, setTimeLeft] = useState(600);
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);

  useEffect(() => {
    setUsername(getUsername());
    setRole(getRole());
    setShowAdminLinks(isAdmin());

    const timer = setInterval(() => {
      setTimeLeft((prev) => (prev > 0 ? prev - 1 : 0));
    }, 1000);

    return () => {
      clearInterval(timer);
    };
  }, []);

  const formatTime = (seconds: number) => {
    const m = Math.floor(seconds / 60);
    const s = seconds % 60;
    return `(${m}:${s.toString().padStart(2, '0')})`;
  };

  const handleLogout = () => {
    clearAuth();
    router.push('/login');
  };

  useEffect(() => {
    if (timeLeft === 0) {
      handleLogout();
    }
  }, [timeLeft]);

  const navLinks: { href: string; label: string }[] = [];

  if (showAdminLinks) {
    navLinks.push({ href: '/admin', label: 'Admin Panel' });
  }

  return (
    <>
      <nav className="bg-gambit_black1 text-white shadow-lg">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between h-16">
            <div className="flex">
              <div className="flex-shrink-0 flex items-center">
                <h1 className="text-xl font-bold">UCP</h1>
              </div>
              <div className="ml-6 flex space-x-8">
                {navLinks.map((link) => (
                  <Link
                    key={link.href}
                    href={link.href}
                    className={`inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium ${
                      pathname === link.href
                        ? 'border-indigo-500 text-white'
                        : 'border-transparent text-gray-300 hover:border-gray-300 hover:text-white'
                    }`}
                  >
                    {link.label}
                  </Link>
                ))}
              </div>
            </div>
            <div className="flex items-center relative">
              <button
                onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                className={`flex items-center space-x-2 px-3 py-2 rounded-t-md transition-colors ${isDropdownOpen ? 'bg-gambit_black1' : 'hover:bg-gambit_grey2'}`}
              >
                <FontAwesomeIcon icon={faUser} className="w-4 h-4 text-white" />
                <span className="text-sm font-medium text-white">
                  {username} <span className="text-gray-400 font-normal ml-1">{formatTime(timeLeft)}</span>
                </span>
                <svg className={`w-4 h-4 text-white transition-transform ${isDropdownOpen ? 'transform rotate-180' : ''}`} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
                </svg>
              </button>

              {isDropdownOpen && (
                <div className="absolute right-0 top-full w-56 bg-gambit_black1 rounded-b-md shadow-xl py-2 z-50 border border-gambit_grey3/50">
                  <Link
                    href="/dashboard"
                    className="flex items-center px-4 py-2 text-sm text-gray-300 hover:text-white hover:bg-gambit_grey3 transition-colors"
                    onClick={() => setIsDropdownOpen(false)}
                  >
                    <FontAwesomeIcon icon={faUser} className="w-4 h-4 mr-3 text-gray-400" />
                    Profile
                  </Link>

                  <div className="border-t border-gambit_grey3/50 my-1 mx-2"></div>

                  <button
                    className="w-full flex items-center px-4 py-2 text-sm text-gray-300 hover:text-white hover:bg-gambit_grey3 transition-colors text-left"
                  >
                    <FontAwesomeIcon icon={faDatabase} className="w-4 h-4 mr-3 text-gray-400" />
                    Change serial
                  </button>
                  <button
                    className="w-full flex items-center px-4 py-2 text-sm text-gray-300 hover:text-white hover:bg-gambit_grey3 transition-colors text-left"
                  >
                    <FontAwesomeIcon icon={faIdCard} className="w-4 h-4 mr-3 text-gray-400" />
                    Change name
                  </button>
                  <button
                    className="w-full flex items-center px-4 py-2 text-sm text-gray-300 hover:text-white hover:bg-gambit_grey3 transition-colors text-left"
                  >
                    <FontAwesomeIcon icon={faKey} className="w-4 h-4 mr-3 text-gray-400" />
                    Change password
                  </button>
                  
                  <div className="border-t border-gambit_grey3/50 my-1 mx-2"></div>
                  
                  <button
                    className="w-full flex items-center px-4 py-2 text-sm text-gray-300 hover:text-white hover:bg-gambit_grey3 transition-colors text-left"
                  >
                    <FontAwesomeIcon icon={faFileLines} className="w-4 h-4 mr-3 text-gray-400" />
                    Tickets
                  </button>
                  <button
                    className="w-full flex items-center px-4 py-2 text-sm text-gray-300 hover:text-white hover:bg-gambit_grey3 transition-colors text-left"
                  >
                    <FontAwesomeIcon icon={faShieldHalved} className="w-4 h-4 mr-3 text-gray-400" />
                    Enable 2FA
                  </button>

                  <div className="border-t border-gambit_grey3/50 my-1 mx-2"></div>

                  <button
                    onClick={handleLogout}
                    className="w-full flex items-center px-4 py-2 text-sm text-gray-300 hover:text-white hover:bg-gambit_grey3 transition-colors text-left"
                  >
                    <FontAwesomeIcon icon={faSignOutAlt} className="w-4 h-4 mr-3 text-gray-400" />
                    Kijelentkezés
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </nav>

      {timeLeft < 60 && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm">
          <div className="bg-gambit_black1 text-white px-8 py-6 rounded-lg shadow-xl max-w-md w-full mx-4 border border-gray-700">
            <div className="text-center">
              <p className="text-lg font-medium mb-6">
                Warning! Your session will expire soon: {Math.floor(timeLeft / 60)}:{timeLeft % 60 < 10 ? '0' : ''}{timeLeft % 60}!
              </p>
              <button
                onClick={() => window.location.reload()}
                className="bg-gambit_berry hover:bg-gambit_berry-second text-white font-medium py-2 px-6 rounded transition-colors"
              >
                Continue Session
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
