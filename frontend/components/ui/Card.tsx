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
    <div className={`bg-gambit_black1 shadow-lg rounded-sm ${className}`}>
      <div className="p-3 sm:p-4">
        <div className="flex items-center gap-2 pb-3 mb-3 border-b-[2px] border-gambit_horizontal">
          {icon && <FontAwesomeIcon icon={icon} className="text-white w-4 h-4" />}
          <h3 className="text-[15px] font-bold leading-6 text-white">
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
