interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'danger';
  children: React.ReactNode;
}

export default function Button({ 
  variant = 'primary', 
  children, 
  className = '',
  ...props 
}: ButtonProps) {
  const baseClasses = 'px-4 py-2 rounded-md font-medium focus:outline-none focus:ring-2 focus:ring-offset-2 disabled:opacity-50';
  
  const variantClasses = {
    primary: 'bg-gambit_purple text-white hover:bg-gambit_purple-second focus:ring-gambit_purple',
    secondary: 'bg-gambit_grey3 text-white hover:bg-gambit_midgrey focus:ring-gambit_midgrey',
    danger: 'bg-gambit_red text-white hover:bg-gambit_red-second focus:ring-gambit_red',
  };

  return (
    <button
      className={`${baseClasses} ${variantClasses[variant]} ${className}`}
      {...props}
    >
      {children}
    </button>
  );
}
