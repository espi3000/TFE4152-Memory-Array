from matplotlib import pyplot as plt

def get_data(filename):
    with open(filename, 'r') as f:
        f.readline()
        f.readline()
        f.readline()
        f.readline()
        f.readline()
        data = {
            'V_in': [],
            'V_ref': [],
            'V_out': []
        }
        for line in f:
            line = line.strip().split(',')
            if len(line) == 4:
                line = line[:-1]
            data['V_in'].append(float(line[0]))
            data['V_ref'].append(float(line[1]))
            data['V_out'].append(float(line[2]))
    return data

plt.style.use('tableau-colorblind10')
plt.figure()

plt.plot([0, 45], [0.225, 0.225], 'grey', linestyle='--')
plt.plot([0.225, 0.225], [0, 45], 'grey', linestyle='--')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/skew_lp/skew_tt.csv')
plt.plot(data['V_in'], data['V_out'], label='tt')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/skew_lp/skew_ff.csv')
plt.plot(data['V_in'], data['V_out'], label='ff')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/skew_lp/skew_ss.csv')
plt.plot(data['V_in'], data['V_out'], label='ss')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/skew_lp/skew_fs.csv')
plt.plot(data['V_in'], data['V_out'], label='fs')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/skew_lp/skew_sf.csv')
plt.plot(data['V_in'], data['V_out'], label='sf')

plt.xlabel('Vin [V]')
plt.ylabel('Vout [V]')
plt.legend()
plt.grid()
plt.xlim(0, 0.45)
plt.ylim(0, 0.45)

plt.savefig('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/plots/skew_lp.png', dpi=300)