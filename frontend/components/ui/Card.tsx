import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { IconDefinition } from '@fortawesome/fontawesome-svg-core';

interface CardProps {
  title: string;
  icon?: IconDefinition;
  children: React.ReactNode;
  className?: string;
}

export default function Card({ title, icon, children, className = '' }: CardProps) {
  return (
    <div className={`bg-gambit_black1 shadow-lg rounded-xl ${className}`}>
      <div className="px-4 py-5 sm:p-6">
        <div className="flex items-center gap-3 pb-4 mb-4 border-b-[2px] border-gambit_horizontal">
          {icon && <FontAwesomeIcon icon={icon} className="text-white w-5 h-5" />}
          <h3 className="text-lg font-bold leading-6 text-white">
            {title}
          </h3>
        </div>
        <div className="text-gambit_lightgrey">
          {children}
        </div>
      </div>
    </div>
  );
}
