interface InputProps extends React.InputHTMLAttributes<HTMLInputElement> {
  label: string;
  error?: string;
  leftIcon?: React.ReactNode;
  labelClassName?: string;
}

export default function Input({ label, error, leftIcon, labelClassName = 'text-gambit_lightgrey', className = '', ...props }: InputProps) {
  return (
    <div className="mb-4">
      <label className={`block text-sm font-medium mb-1 ${labelClassName}`}>
        {label}
      </label>
      <div className="relative">
        {leftIcon && (
          <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gambit_midgrey">
            {leftIcon}
          </div>
        )}
        <input
          className={`w-full ${leftIcon ? 'pl-10' : 'px-3'} py-2 bg-gambit_grey4 text-white border rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-gambit_purple focus:border-gambit_purple ${
            error ? 'border-gambit_red' : 'border-gambit_grey3'
          } ${className}`}
          {...props}
        />
      </div>
      {error && <p className="mt-1 text-sm text-gambit_red">{error}</p>}
    </div>
  );
}
