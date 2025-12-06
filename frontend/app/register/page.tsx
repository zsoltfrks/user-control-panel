'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { apiClient } from '@/lib/api';
import { saveAuth } from '@/lib/auth';
import Input from '@/components/ui/Input';
import Button from '@/components/ui/Button';

export default function RegisterPage() {
  const router = useRouter();
  const [formData, setFormData] = useState({
    username: '',
    email: '',
    password: '',
    confirmPassword: '',
  });
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    if (formData.password !== formData.confirmPassword) {
      setError('Passwords do not match');
      return;
    }

    setLoading(true);

    try {
      const { confirmPassword, ...registerData } = formData;
      const response = await apiClient.register(registerData);
      saveAuth(response);
      router.push('/dashboard');
    } catch (err: any) {
      setError(err.message || 'Registration failed');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gambit_grey1 flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-md w-full space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-extrabold text-white">
            UCP - Register
          </h2>
          <p className="mt-2 text-center text-sm text-gambit_lightgrey">
            Create a new account
          </p>
        </div>
        <form className="mt-8 space-y-6 bg-gambit_grey2 p-8 rounded-xl shadow-2xl border border-gambit_grey3/50" onSubmit={handleSubmit}>
          {error && (
            <div className="bg-gambit_red/10 border border-gambit_red text-gambit_red px-4 py-3 rounded flex items-center gap-2">
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              {error}
            </div>
          )}

          <Input
            label="Username"
            type="text"
            value={formData.username}
            onChange={(e) => setFormData({ ...formData, username: e.target.value })}
            required
          />

          <Input
            label="Email"
            type="email"
            value={formData.email}
            onChange={(e) => setFormData({ ...formData, email: e.target.value })}
            required
          />

          <Input
            label="Password"
            type="password"
            value={formData.password}
            onChange={(e) => setFormData({ ...formData, password: e.target.value })}
            required
          />

          <Input
            label="Confirm Password"
            type="password"
            value={formData.confirmPassword}
            onChange={(e) => setFormData({ ...formData, confirmPassword: e.target.value })}
            required
          />

          <Button type="submit" className="w-full bg-gambit_purple hover:bg-gambit_purple-second text-white font-bold py-3 rounded-lg shadow-lg transform transition-all hover:scale-[1.02]" disabled={loading}>
            {loading ? 'Creating account...' : 'Register'}
          </Button>

          <div className="text-center mt-6">
            <Link href="/login" className="text-gray-400 hover:text-white text-sm transition-colors">
              Already have an account? <span className="text-gambit_purple hover:text-gambit_purple-second font-medium">Sign In</span>
            </Link>
          </div>
        </form>
      </div>
    </div>
  );
}
