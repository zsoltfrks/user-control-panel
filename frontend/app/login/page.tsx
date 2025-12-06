'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
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
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
      )}
        <form className="mt-8 space-y-6 bg-gambit_black1 p-8 rounded-xl shadow-2xl border border-gambit_black1/50" onSubmit={handleSubmit}>
          
          <Input
            label="Username"
            type="text"
            value={formData.username}
            onChange={(e) => setFormData({ ...formData, username: e.target.value })}
            required
            className="bg-gambit_grey4 border-gambit_grey3 text-white placeholder-gray-500 focus:border-gambit_purple focus:ring-1 focus:ring-gambit_purple transition-all"
            labelClassName="text-gray-300 font-medium"
            leftIcon={
              <svg className="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
              </svg>
            }
          />

          <Input
            label="Password"
            type="password"
            value={formData.password}
            onChange={(e) => setFormData({ ...formData, password: e.target.value })}
            required
            className="bg-gambit_grey4 border-gambit_grey3 text-white placeholder-gray-500 focus:border-gambit_purple focus:ring-1 focus:ring-gambit_purple transition-all"
            labelClassName="text-gray-300 font-medium"
            leftIcon={
              <svg className="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
              </svg>
            }
          />

          <Button 
            type="submit" 
            className="w-full bg-gambit_purple hover:bg-gambit_purple-second text-white font-bold py-3 rounded-lg shadow-lg transform transition-all hover:scale-[1.02] active:scale-[0.98]" 
            disabled={loading}
          >
            {loading ? 'Signing in...' : 'Sign In'}
          </Button>

          <div className="text-center mt-6">
            <Link href="/register" className="text-gray-400 hover:text-white text-sm transition-colors">
              Don&apos;t have an account? <span className="text-gambit_purple hover:text-gambit_purple-second font-medium">Register</span>
            </Link>
          </div>
        </form>
      </div>
    </div>
  );
}
