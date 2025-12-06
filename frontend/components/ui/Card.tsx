interface CardProps {
  title: string;
  children: React.ReactNode;
  className?: string;
}

export default function Card({ title, children, className = '' }: CardProps) {
  return (
    <div className={`bg-gambit_black1 shadow-lg rounded-xl border border-gambit_grey3/50 ${className}`}>
      <div className="px-4 py-5 sm:p-6">
        <h3 className="text-lg font-bold leading-6 text-white mb-4">
          {title}
        </h3>
        <div className="text-gambit_lightgrey">
          {children}
        </div>
      </div>
    </div>
  );
}
