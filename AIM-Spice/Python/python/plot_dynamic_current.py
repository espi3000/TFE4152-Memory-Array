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
            'I_dd': []
        }
        for line in f:
            line = line.strip().split(',')
            if len(line) == 3:
                line = line[:-1]
            data['V_in'].append(float(line[0]))
            data['I_dd'].append(float(line[1]))
    return data

plt.style.use('tableau-colorblind10')
plt.figure()

plt.plot([0.225, 0.225], [0, 45], 'grey', linestyle='--')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/dynamic_current_lp/dynamic_current_tt.csv')
plt.plot(data['V_in'], data['I_dd'], label='tt')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/dynamic_current_lp/dynamic_current_ff.csv')
plt.plot(data['V_in'], data['I_dd'], label='ff')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/dynamic_current_lp/dynamic_current_ss.csv')
plt.plot(data['V_in'], data['I_dd'], label='ss')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/dynamic_current_lp/dynamic_current_fs.csv')
plt.plot(data['V_in'], data['I_dd'], label='fs')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/dynamic_current_lp/dynamic_current_sf.csv')
plt.plot(data['V_in'], data['I_dd'], label='sf')

plt.xlabel('Vin [V]')
plt.ylabel('Idd [A]')
plt.legend()
plt.grid()
plt.xlim(0, 0.45)
plt.ylim(0, 0.6e-6)

plt.savefig('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/plots/dynamic_current_lp.png', dpi=300)