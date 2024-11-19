import pandas as pd
import numpy as np

# Read ECG data from XLSX
data = pd.read_excel('ecg_data.xlsx')

# Extract ECG signal data
ecg_signal_1 = data['Signal_1'].values
ecg_signal_2 = data['Signal_2'].values

# Calculate peak amplitude
peak_amplitude_1 = max(max(ecg_signal_1), abs(min(ecg_signal_1)))
peak_amplitude_2 = max(max(ecg_signal_2), abs(min(ecg_signal_2)))

# Calculate RMS amplitude
rms_amplitude_1 = np.sqrt(np.mean(np.square(ecg_signal_1)))
rms_amplitude_2 = np.sqrt(np.mean(np.square(ecg_signal_2)))

# Calculate crest factor
crest_factor_1 = peak_amplitude_1 / rms_amplitude_1
crest_factor_2 = peak_amplitude_2 / rms_amplitude_2

print("Crest Factor of ECG Signal 1:", crest_factor_1)
print("Crest Factor of ECG Signal 2:", crest_factor_2)
