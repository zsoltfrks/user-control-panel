'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { isAuthenticated, isAdmin } from '@/lib/auth';
import { apiClient } from '@/lib/api';
import Navigation from '@/components/layout/Navigation';
import Card from '@/components/ui/Card';
import Button from '@/components/ui/Button';

export default function AdminPage() {
  const router = useRouter();
  const [activeTab, setActiveTab] = useState<'users' | 'assets' | 'bans'>('users');
  const [users, setUsers] = useState<any[]>([]);
  const [houses, setHouses] = useState<any[]>([]);
  const [vehicles, setVehicles] = useState<any[]>([]);
  const [bans, setBans] = useState<any[]>([]);
  const [warnings, setWarnings] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!isAuthenticated()) {
      router.push('/login');
      return;
    }

    if (!isAdmin()) {
      router.push('/dashboard');
      return;
    }

    loadAdminData();
  }, [router]);

  const loadAdminData = async () => {
    try {
      const [usersData, housesData, vehiclesData, bansData, warningsData] = await Promise.all([
        apiClient.getAllUsers(),
        apiClient.getAllHouses(),
        apiClient.getAllVehicles(),
        apiClient.getAllBans(),
        apiClient.getAllWarnings(),
      ]);

      setUsers(usersData);
      setHouses(housesData);
      setVehicles(vehiclesData);
      setBans(bansData);
      setWarnings(warningsData);
    } catch (error) {
      console.error('Failed to load admin data:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleToggleUserActive = async (userId: number) => {
    try {
      const updatedUser = await apiClient.toggleUserActive(userId);
      // Update local state instead of reloading all data
      setUsers(prevUsers => 
        prevUsers.map(user => 
          user.id === userId ? updatedUser : user
        )
      );
    } catch (error) {
      console.error('Failed to toggle user active status:', error);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gambit_grey1">
        <Navigation />
        <div className="max-w-[1380px] mx-auto py-6 sm:px-6 lg:px-8">
          <p className="text-center text-white">Loading...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gambit_grey1">
      <Navigation />
      <div className="max-w-[1380px] mx-auto py-6 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-white mb-6">Admin Panel</h1>

        <div className="mb-6 border-b border-gambit_grey3">
          <nav className="-mb-px flex space-x-8">
            <button
              onClick={() => setActiveTab('users')}
              className={`py-4 px-1 border-b-2 font-medium text-sm ${
                activeTab === 'users'
                  ? 'border-gambit_purple text-gambit_purple'
                  : 'border-transparent text-gambit_lightgrey hover:text-white hover:border-gambit_lightgrey'
              }`}
            >
              Users ({users.length})
            </button>
            <button
              onClick={() => setActiveTab('assets')}
              className={`py-4 px-1 border-b-2 font-medium text-sm ${
                activeTab === 'assets'
                  ? 'border-gambit_purple text-gambit_purple'
                  : 'border-transparent text-gambit_lightgrey hover:text-white hover:border-gambit_lightgrey'
              }`}
            >
              Assets ({houses.length + vehicles.length})
            </button>
            <button
              onClick={() => setActiveTab('bans')}
              className={`py-4 px-1 border-b-2 font-medium text-sm ${
                activeTab === 'bans'
                  ? 'border-gambit_purple text-gambit_purple'
                  : 'border-transparent text-gambit_lightgrey hover:text-white hover:border-gambit_lightgrey'
              }`}
            >
              Bans & Warnings ({bans.length + warnings.length})
            </button>
          </nav>
        </div>

        {activeTab === 'users' && (
          <Card title="User Management">
            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gambit_grey3">
                <thead className="bg-gambit_grey3">
                  <tr>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gambit_lightgrey uppercase">Username</th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gambit_lightgrey uppercase">Email</th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gambit_lightgrey uppercase">Role</th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gambit_lightgrey uppercase">Status</th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gambit_lightgrey uppercase">Actions</th>
                  </tr>
                </thead>
                <tbody className="bg-gambit_grey2 divide-y divide-gambit_grey3">
                  {users.map((user) => (
                    <tr key={user.id}>
                      <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-white">{user.username}</td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gambit_lightgrey">{user.email}</td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gambit_lightgrey">{user.role}</td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${
                          user.active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                        }`}>
                          {user.active ? 'Active' : 'Inactive'}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm">
                        <Button
                          variant="secondary"
                          onClick={() => handleToggleUserActive(user.id)}
                          className="text-xs"
                        >
                          {user.active ? 'Deactivate' : 'Activate'}
                        </Button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </Card>
        )}

        {activeTab === 'assets' && (
          <div className="space-y-6">
            <Card title={`Houses (${houses.length})`}>
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Owner</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Address</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Price</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Status</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {houses.map((house) => (
                      <tr key={house.id}>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{house.ownerName}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{house.address}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${house.price?.toLocaleString()}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                          {house.locked ? 'Locked' : 'Unlocked'}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </Card>

            <Card title={`Vehicles (${vehicles.length})`}>
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Owner</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Model</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Plate</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Status</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {vehicles.map((vehicle) => (
                      <tr key={vehicle.id}>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{vehicle.ownerName}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{vehicle.model}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{vehicle.plateNumber}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                          {vehicle.impounded ? 'Impounded' : 'Available'}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </Card>
          </div>
        )}

        {activeTab === 'bans' && (
          <div className="space-y-6">
            <Card title={`Bans (${bans.length})`}>
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">User</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Reason</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Banned By</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Status</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {bans.map((ban) => (
                      <tr key={ban.id}>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{ban.username}</td>
                        <td className="px-6 py-4 text-sm text-gray-500">{ban.reason}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{ban.bannedBy}</td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${
                            ban.active ? 'bg-red-100 text-red-800' : 'bg-gray-100 text-gray-800'
                          }`}>
                            {ban.active ? 'Active' : 'Inactive'}
                          </span>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </Card>

            <Card title={`Warnings (${warnings.length})`}>
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">User</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Reason</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Warned By</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Status</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {warnings.map((warning) => (
                      <tr key={warning.id}>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{warning.username}</td>
                        <td className="px-6 py-4 text-sm text-gray-500">{warning.reason}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{warning.warnedBy}</td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${
                            warning.acknowledged ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'
                          }`}>
                            {warning.acknowledged ? 'Acknowledged' : 'Pending'}
                          </span>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </Card>
          </div>
        )}
      </div>
    </div>
  );
}
