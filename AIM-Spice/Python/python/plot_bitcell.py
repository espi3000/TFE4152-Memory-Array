from matplotlib import pyplot as plt

def get_data(filename):
    with open(filename, 'r') as f:
        f.readline()
        f.readline()
        f.readline()
        f.readline()
        f.readline()
        data = {
            'time': [],
            'V_rw': [],
            'V_out': []
        }
        for line in f:
            line = line.strip().split(',')
            if len(line) == 4:
                line = line[:-1]
            data['time'].append(float(line[0]) - 3.5e-9)
            data['V_rw'].append(float(line[1]))
            data['V_out'].append(float(line[2]))
    return data

plt.style.use('tableau-colorblind10')
plt.figure()

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/bitcell_lp/bitcell_tt.csv')
plt.plot(data['time'], data['V_out'], label='tt')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/bitcell_lp/bitcell_ff.csv')
plt.plot(data['time'], data['V_out'], label='ff')

plt.plot(data['time'], data['V_rw'], label='rw', linestyle='--')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/bitcell_lp/bitcell_ss.csv')
plt.plot(data['time'], data['V_out'], label='ss')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/bitcell_lp/bitcell_fs.csv')
plt.plot(data['time'], data['V_out'], label='fs')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/bitcell_lp/bitcell_sf.csv')
plt.plot(data['time'], data['V_out'], label='sf')

plt.xlabel('time [s]')
plt.ylabel('Vout [V]')
plt.legend()
plt.grid()
plt.xlim(0, 8.5e-9)

plt.savefig('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/plots/bitcell_lp.png', dpi=300)