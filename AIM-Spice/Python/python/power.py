def get_data(filename):
    with open(filename, 'r') as f:
        f.readline()
        f.readline()
        f.readline()
        f.readline()
        f.readline()
        data = {
            'time': [],
            'V_dd': [],
            'I_dd': []
        }
        for line in f:
            line = line.strip().split(',')
            if len(line) == 4:
                line = line[:-1]
            data['time'].append(float(line[0]))
            data['V_dd'].append(float(line[1]))
            data['I_dd'].append(float(line[2]))
    return data

def get_power(data):
    data['I_dd'] = [abs(i) for i in data['I_dd']]
    data['P'] = [v*i for v, i in zip(data['V_dd'], data['I_dd'])]
    return sum(data['P'])/len(data['P'])

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/current_lp/current_w_1.csv')
power = get_power(data)
print(f'Power_tt_w_1: {power} W')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/current_lp/current_w_0.csv')
power = get_power(data)
print(f'Power_tt_w_0: {power} W')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/current_lp/current_r_1.csv')
power = get_power(data)
print(f'Power_tt_r_1: {power} W')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/current_lp/current_r_0.csv')
power = get_power(data)
print(f'Power_tt_r_0: {power} W')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/current_lp/current_sel_high_r_0.csv')
power = get_power(data)
print(f'Power_tt_sel_high_r_0: {power} W')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/current_lp/current_sel_high_r_1.csv')
power = get_power(data)
print(f'Power_tt_sel_high_r_1: {power} W')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/current_lp/current_sel_high_w_0.csv')
power = get_power(data)
print(f'Power_tt_sel_high_w_0: {power} W')

data = get_data('c:/Users/espen/Repositories/TFE4152/TFE4152-Memory-Array/AIM-Spice/Python/data/current_lp/current_sel_high_w_1.csv')
power = get_power(data)
print(f'Power_tt_sel_high_w_1: {power} W')