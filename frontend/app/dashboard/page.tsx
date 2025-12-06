'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { isAuthenticated } from '@/lib/auth';
import { apiClient } from '@/lib/api';
import Navigation from '@/components/layout/Navigation';
import Card from '@/components/ui/Card';

export default function DashboardPage() {
  const router = useRouter();
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
      const [profileData, housesData, vehiclesData] = await Promise.all([
        apiClient.getMyProfile(),
        apiClient.getMyHouses(),
        apiClient.getMyVehicles(),
      ]);

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
      <div className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-white mb-6">Dashboard</h1>

        <div className="grid grid-cols-1 gap-6 mb-6">
          <Card title="Player Profile">
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <div>
                <p className="text-sm text-gambit_lightgrey">Character Name</p>
                <p className="font-medium text-white">{profile?.characterName || 'Not set'}</p>
              </div>
              <div>
                <p className="text-sm text-gambit_lightgrey">Level</p>
                <p className="font-medium text-white">{profile?.level}</p>
              </div>
              <div>
                <p className="text-sm text-gambit_lightgrey">Money</p>
                <p className="font-medium text-white">${profile?.money?.toLocaleString()}</p>
              </div>
              <div>
                <p className="text-sm text-gambit_lightgrey">Played Hours</p>
                <p className="font-medium text-white">{profile?.playedHours}</p>
              </div>
            </div>
          </Card>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <Card title={`My Houses (${houses.length})`}>
            {houses.length === 0 ? (
              <p className="text-gambit_lightgrey">No houses owned</p>
            ) : (
              <div className="space-y-3">
                {houses.map((house) => (
                  <div key={house.id} className="border-b border-gambit_grey3 pb-3 last:border-b-0">
                    <p className="font-medium text-white">{house.address}</p>
                    <p className="text-sm text-gambit_lightgrey">
                      Price: ${house.price?.toLocaleString()} | Interior: {house.interiorId}
                    </p>
                    <p className="text-sm text-gambit_lightgrey">
                      Status: {house.locked ? 'Locked' : 'Unlocked'}
                    </p>
                  </div>
                ))}
              </div>
            )}
          </Card>

          <Card title={`My Vehicles (${vehicles.length})`}>
            {vehicles.length === 0 ? (
              <p className="text-gambit_lightgrey">No vehicles owned</p>
            ) : (
              <div className="space-y-3">
                {vehicles.map((vehicle) => (
                  <div key={vehicle.id} className="border-b border-gambit_grey3 pb-3 last:border-b-0">
                    <p className="font-medium text-white">{vehicle.model}</p>
                    <p className="text-sm text-gambit_lightgrey">
                      Plate: {vehicle.plateNumber} | Color: {vehicle.color}
                    </p>
                    <p className="text-sm text-gambit_lightgrey">
                      Health: {vehicle.health}/1000 | 
                      {vehicle.impounded ? ' Impounded' : ' Available'}
                    </p>
                  </div>
                ))}
              </div>
            )}
          </Card>
        </div>
      </div>
    </div>
  );
}
