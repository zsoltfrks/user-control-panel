'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { isAuthenticated } from '@/lib/auth';
import { apiClient } from '@/lib/api';
import Navigation from '@/components/layout/Navigation';
import Card from '@/components/ui/Card';

export default function DashboardPage() {
  const router = useRouter();
  const [user, setUser] = useState<any>(null);
  const [profile, setProfile] = useState<any>(null);
  const [houses, setHouses] = useState<any[]>([]);
  const [vehicles, setVehicles] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!isAuthenticated()) {
      router.push('/login');
      return;
    }

    loadDashboardData();
  }, [router]);

  const loadDashboardData = async () => {
    try {
      const [userData, profileData, housesData, vehiclesData] = await Promise.all([
        apiClient.getCurrentUser(),
        apiClient.getMyProfile(),
        apiClient.getMyHouses(),
        apiClient.getMyVehicles(),
      ]);

      setUser(userData);
      setProfile(profileData);
      setHouses(housesData);
      setVehicles(vehiclesData);
    } catch (error) {
      console.error('Failed to load dashboard data:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gambit_grey1">
        <Navigation />
        <div className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
          <p className="text-center text-white">Loading...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gambit_grey1">
      <Navigation />
      <div className="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
        
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-6">
          
          {/* Left Sidebar */}
          <div className="lg:col-span-1 space-y-6">
            
            {/* Character Image Card */}
            <div className="bg-gambit_grey2 rounded-xl overflow-hidden shadow-lg border border-gambit_grey3/50">
              <div className="h-64 bg-gambit_grey4 flex items-center justify-center relative group">
                {/* Placeholder for character image */}
                <svg className="w-24 h-24 text-gambit_grey3" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
                </svg>
                <div className="absolute inset-0 bg-black/20 hidden group-hover:flex items-center justify-center">
                  <span className="text-white text-sm font-medium">Change Photo</span>
                </div>
              </div>
              <div className="p-4 border-t border-gambit_grey3">
                <h2 className="text-xl font-bold text-white">{profile?.characterName || 'No Character'}</h2>
                <p className="text-sm text-gambit_lightgrey mt-1">Character ID: {profile?.id || 'N/A'}</p>
              </div>
            </div>

            {/* Character Stats */}
            <Card title={profile?.characterName || 'Character Info'}>
              <div className="space-y-3 text-sm">
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Character ID</span>
                  <span className="text-white font-mono bg-gambit_blue px-2 py-0.5 rounded text-xs">{profile?.id || 'N/A'}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Played Time</span>
                  <div className="flex items-center gap-2">
                    <span className="text-white">{profile?.playedHours || 0} hours</span>
                    <span className="bg-gambit_green-second text-white text-xs px-1.5 py-0.5 rounded">LVL {profile?.level || 1}</span>
                  </div>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Cash</span>
                  <span className="text-white bg-gambit_red px-2 py-0.5 rounded text-xs font-mono">${profile?.money?.toLocaleString() || 0}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Bank</span>
                  <span className="text-white bg-gambit_green px-2 py-0.5 rounded text-xs font-mono">$0</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">SlotCoins</span>
                  <span className="text-gambit_grey1 bg-gambit_yellow px-2 py-0.5 rounded text-xs font-bold">0 SSC</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Last Used</span>
                  <span className="text-white bg-gambit_blue px-2 py-0.5 rounded text-xs">{new Date().toLocaleDateString()}</span>
                </div>
              </div>
            </Card>

            {/* Account Info */}
            <Card title={user?.username || 'Account Info'}>
              <div className="space-y-3 text-sm">
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Account ID</span>
                  <span className="text-white bg-gambit_blue px-2 py-0.5 rounded text-xs">{user?.id || 'N/A'}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Email</span>
                  <span className="text-white bg-gambit_blue px-2 py-0.5 rounded text-xs truncate max-w-[150px]">{user?.email || 'N/A'}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Last Online</span>
                  <span className="text-white bg-gambit_blue px-2 py-0.5 rounded text-xs">{new Date().toLocaleDateString()}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Registered</span>
                  <span className="text-white bg-gambit_blue px-2 py-0.5 rounded text-xs">{user?.createdAt ? new Date(user.createdAt).toLocaleDateString() : 'N/A'}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-gambit_lightgrey bg-gambit_grey4 px-2 py-1 rounded border border-gambit_grey3 text-xs font-bold uppercase tracking-wider">Premium</span>
                  <span className="text-white bg-gambit_blue px-2 py-0.5 rounded text-xs">0 PP</span>
                </div>
                <div className="mt-4 text-center">
                   <button className="text-gambit_blue hover:text-gambit_blue-second text-xs font-medium transition-colors">View Profile</button>
                </div>
              </div>
            </Card>

            {/* Status */}
            <Card title="Status">
               <div className="space-y-4">
                  <div className="relative pt-1">
                    <div className="flex mb-2 items-center justify-between">
                      <div className="text-right">
                        <span className="text-xs font-semibold inline-block text-gambit_lightgrey bg-gambit_grey4 px-2 py-0.5 rounded border border-gambit_grey3">
                          HP
                        </span>
                      </div>
                    </div>
                    <div className="overflow-hidden h-2 mb-4 text-xs flex rounded bg-gambit_grey4">
                      <div style={{ width: "100%" }} className="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-gambit_green"></div>
                    </div>
                  </div>
                  
                  <div className="relative pt-1">
                    <div className="flex mb-2 items-center justify-between">
                      <div className="text-right">
                        <span className="text-xs font-semibold inline-block text-gambit_lightgrey bg-gambit_grey4 px-2 py-0.5 rounded border border-gambit_grey3">
                          Needs
                        </span>
                      </div>
                    </div>
                    <div className="flex gap-2">
                        <div className="overflow-hidden h-2 mb-4 text-xs flex rounded bg-gambit_grey4 w-1/2">
                            <div style={{ width: "80%" }} className="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-gambit_yellow"></div>
                        </div>
                        <div className="overflow-hidden h-2 mb-4 text-xs flex rounded bg-gambit_grey4 w-1/2">
                            <div style={{ width: "90%" }} className="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-gambit_blue"></div>
                        </div>
                    </div>
                  </div>
               </div>
            </Card>

          </div>

          {/* Right Content */}
          <div className="lg:col-span-3 space-y-6">
            
            {/* Vehicles */}
            <Card title={`Vehicles (${vehicles.length})`}>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-gambit_grey4 text-gambit_lightgrey border-b border-gambit_grey3">
                    <tr>
                      <th className="px-4 py-3 text-left font-medium">ID</th>
                      <th className="px-4 py-3 text-left font-medium">Plate</th>
                      <th className="px-4 py-3 text-left font-medium">Model</th>
                      <th className="px-4 py-3 text-right font-medium">Action</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gambit_grey3">
                    {vehicles.length === 0 ? (
                      <tr>
                        <td colSpan={4} className="px-4 py-8 text-center text-gambit_lightgrey italic">
                          <span className="inline-block mr-2">∅</span> No results found.
                        </td>
                      </tr>
                    ) : (
                      vehicles.map((vehicle) => (
                        <tr key={vehicle.id} className="hover:bg-gambit_grey4/50 transition-colors">
                          <td className="px-4 py-3 text-white font-mono">{vehicle.id}</td>
                          <td className="px-4 py-3">
                            <span className="bg-gambit_green text-white px-2 py-0.5 rounded text-xs font-bold uppercase tracking-wider border border-gambit_green-second">
                              {vehicle.plateNumber}
                            </span>
                          </td>
                          <td className="px-4 py-3 text-gambit_lightgrey">{vehicle.model}</td>
                          <td className="px-4 py-3 text-right">
                            <button className="text-gambit_lightgrey hover:text-white">
                              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>
                            </button>
                          </td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>
            </Card>

            {/* Interiors */}
            <Card title={`Interiors (${houses.length})`}>
               <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-gambit_grey4 text-gambit_lightgrey border-b border-gambit_grey3">
                    <tr>
                      <th className="px-4 py-3 text-left font-medium">ID</th>
                      <th className="px-4 py-3 text-left font-medium">Name</th>
                      <th className="px-4 py-3 text-left font-medium">Type</th>
                      <th className="px-4 py-3 text-right font-medium">Action</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gambit_grey3">
                    {houses.length === 0 ? (
                      <tr>
                        <td colSpan={4} className="px-4 py-8 text-center text-gambit_lightgrey italic">
                          <span className="inline-block mr-2">∅</span> No results found.
                        </td>
                      </tr>
                    ) : (
                      houses.map((house) => (
                        <tr key={house.id} className="hover:bg-gambit_grey4/50 transition-colors">
                          <td className="px-4 py-3 text-white font-mono">{house.id}</td>
                          <td className="px-4 py-3 text-white">{house.address}</td>
                          <td className="px-4 py-3 text-gambit_lightgrey">{house.interiorId}</td>
                          <td className="px-4 py-3 text-right">
                             <button className="text-gambit_lightgrey hover:text-white">
                              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>
                            </button>
                          </td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>
            </Card>

            {/* Rentals */}
            <Card title="Rentals (0)">
               <div className="px-4 py-8 text-center text-gambit_lightgrey italic text-sm border-t border-gambit_grey3">
                  <span className="inline-block mr-2">∅</span> No results found.
               </div>
            </Card>

            {/* Pets */}
            <Card title="Pets (0)">
               <div className="px-4 py-8 text-center text-gambit_lightgrey italic text-sm border-t border-gambit_grey3">
                  <span className="inline-block mr-2">∅</span> No results found.
               </div>
            </Card>

            {/* Weapon Skills */}
            <Card title="Weapon Skills (0)">
               <div className="px-4 py-8 text-center text-gambit_lightgrey italic text-sm border-t border-gambit_grey3">
                  <span className="inline-block mr-2">∅</span> No results found.
               </div>
            </Card>

            {/* Name Changes */}
            <Card title="Name Changes (1)">
               <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-gambit_grey4 text-gambit_lightgrey border-b border-gambit_grey3">
                    <tr>
                      <th className="px-4 py-3 text-left font-medium">Date</th>
                      <th className="px-4 py-3 text-left font-medium">New Name</th>
                      <th className="px-4 py-3 text-left font-medium">Reason</th>
                      <th className="px-4 py-3 text-left font-medium">Status</th>
                      <th className="px-4 py-3 text-right font-medium"></th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gambit_grey3">
                    <tr className="hover:bg-gambit_grey4/50 transition-colors">
                        <td className="px-4 py-3 text-white">2021. 11. 19. 17:47</td>
                        <td className="px-4 py-3 text-white">{profile?.characterName || 'Jorge Mendoza'}</td>
                        <td className="px-4 py-3 text-white">V3 registration</td>
                        <td className="px-4 py-3">
                            <span className="bg-gambit_green text-white px-2 py-0.5 rounded text-xs font-bold uppercase tracking-wider">System</span>
                        </td>
                        <td className="px-4 py-3 text-right">
                            <button className="text-gambit_lightgrey hover:text-white">
                                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 5l7 7-7 7"></path></svg>
                            </button>
                        </td>
                    </tr>
                  </tbody>
                </table>
                <div className="p-4 flex justify-center border-t border-gambit_grey3">
                    <button className="bg-gambit_green hover:bg-gambit_green-second text-white text-xs font-bold py-2 px-4 rounded transition-colors flex items-center gap-2">
                        <span>+</span> New name change request
                    </button>
                </div>
              </div>
            </Card>

            {/* Inventory */}
            <Card title="Inventory">
               <div className="p-4 border-t border-gambit_grey3 flex justify-center">
                  <div className="bg-gambit_grey4 p-2 rounded border border-gambit_grey3 inline-block">
                      <div className="flex gap-4 mb-2 justify-center text-gambit_lightgrey">
                          <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path></svg>
                          <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 7a2 2 0 012 2m4 0a6 6 0 01-7.743 5.743L11.536 9.636a1.003 1.003 0 00-.464-.464L7.5 7.5 5.636 5.636a1.5 1.5 0 00-2.121 0l-.879.879a1.5 1.5 0 000 2.121l1.879 1.879 1.5 1.5 0 002.121 0L9.636 11.536a1.003 1.003 0 00.464.464L14.5 14.5a6 6 0 015.743-7.743A2 2 0 0115 7z"></path></svg>
                          <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"></path></svg>
                      </div>
                      <div className="grid grid-cols-8 gap-1">
                          {[...Array(32)].map((_, i) => (
                              <div key={i} className="w-10 h-10 bg-gambit_grey3/50 border border-gambit_grey3 hover:bg-gambit_grey3 transition-colors rounded-sm relative">
                                  {i === 0 && <div className="absolute inset-0 flex items-center justify-center text-xs">📱</div>}
                                  {i === 1 && <div className="absolute inset-0 flex items-center justify-center text-xs">📻</div>}
                                  {i === 2 && <div className="absolute inset-0 flex items-center justify-center text-xs">💳</div>}
                              </div>
                          ))}
                      </div>
                  </div>
               </div>
            </Card>

          </div>
        </div>
      </div>
    </div>
  );
}
