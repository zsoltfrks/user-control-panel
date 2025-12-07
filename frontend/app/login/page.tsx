'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faLock, faTimes, faRightToBracket } from '@fortawesome/free-solid-svg-icons';
import { apiClient } from '@/lib/api';
import { saveAuth } from '@/lib/auth';
import Input from '@/components/ui/Input';
import Button from '@/components/ui/Button';

export default function LoginPage() {
  const router = useRouter();
  const [formData, setFormData] = useState({
    username: '',
    password: '',
  });
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);

    try {
      const response = await apiClient.login(formData);
      saveAuth(response);
      router.push('/dashboard');
    } catch (err: any) {
      setError(err.message || 'Login failed');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gambit_grey1 flex flex-col items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-md w-full space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-extrabold text-white">
            UCP - Sign In
          </h2>
          <p className="mt-2 text-center text-sm text-gray-400">
            Sign in to your account
          </p>
        </div>
        {error && (
        <div className="max-w-md w-full mb-6 bg-gambit_red text-white px-4 py-3 rounded relative shadow-lg flex justify-between items-center animate-fade-in">
          <span className="font-medium">{error}</span>
          <button 
            onClick={() => setError('')}
            className="text-white/80 hover:text-white focus:outline-none transition-colors"
          >
            <FontAwesomeIcon icon={faTimes} className="w-5 h-5" />
          </button>
        </div>
      )}
        <form className="mt-8 space-y-6 bg-gambit_black1 p-8 rounded-xl shadow-2xl border border-gambit_black1/50" onSubmit={handleSubmit}>
          
          <Input
            type="text"
            placeholder='Username'
            value={formData.username}
            onChange={(e) => setFormData({ ...formData, username: e.target.value })}
            required
            className="bg-gambit_grey4 border-gambit_grey3 text-white placeholder-gray-500 focus:border-gambit_purple focus:ring-1 focus:ring-gambit_purple transition-all"
            labelClassName="text-gray-300 font-medium"
            leftIcon={
              <FontAwesomeIcon icon={faUser} className="w-5 h-5 text-gray-400" />
            }
          />

          <Input
            type="password"
            placeholder='********'
            value={formData.password}
            onChange={(e) => setFormData({ ...formData, password: e.target.value })}
            required
            className="bg-gambit_grey4 border-gambit_grey3 text-white placeholder-gray-500 focus:border-gambit_purple focus:ring-1 focus:ring-gambit_purple transition-all"
            labelClassName="text-gray-300 font-medium"
            leftIcon={
              <FontAwesomeIcon icon={faLock} className="w-5 h-5 text-gray-400" />
            }
          />

          <Button 
            type="submit" 
            className="w-full bg-gambit_berry hover:bg-gambit_berry-second text-white font-bold py-3 rounded-lg shadow-lg transform transition-all active:scale-[0.98] flex items-center justify-center gap-2" 
            disabled={loading}
          >
            {loading ? (
              'Signing in...'
            ) : (
              <>
                <FontAwesomeIcon icon={faRightToBracket} />
                Sign In
              </>
            )}
          </Button>

          <div className="text-center mt-6">
            <Link href="/register" className="text-gray-400 hover:text-white text-sm transition-colors">
              Don&apos;t have an account? <span className="text-gambit_berry hover:text-gambit_berry-second font-medium">Register</span>
            </Link>
          </div>
        </form>
      </div>
    </div>
  );
}
