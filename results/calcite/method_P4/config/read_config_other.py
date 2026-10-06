import configparser
import sys

def read_config(config_file=''):

    config = configparser.ConfigParser()

    # Reading the configuration file.
    # The first command line argument will be the path of the config file.
    if config_file == '':
        config.read(sys.argv[1])
    else:
        config.read(config_file)

    config_dict = {}

    # Reading debug value
    debug = config['DEFAULT']['debug']
    config_dict['debug'] = debug

    # Reading prompt_path value
    prompt_path = config['PATH']['prompt_path']
    config_dict['prompt_path'] = prompt_path

    # Reading context_prompt_path value
    # context_prompt_path = config['PATH']['context_prompt_path']
    # config_dict['context_prompt_path'] = context_prompt_path

    # Reading context_prompt_path value
    dataset_path = config['PATH']['dataset_path']
    config_dict['dataset_path'] = dataset_path

    # Reading llm_path value
    llm_path = config['PATH']['llm_path']
    config_dict['llm_path'] = llm_path

    # Reading how many prompts file are there
    prompt_count = config['FILE']['prompt_count']
    config_dict['prompt_count'] = prompt_count

    # Reading prompt files
    for i in range(1,int(config_dict['prompt_count'])+1):
        
        prompt_name = 'prompt_file_'+str(i)
        # Reading prompt_file value
        prompt_file = config['FILE'][prompt_name]
        config_dict[prompt_name] = prompt_file

    # Reading context_prompt_file value
    # context_prompt_file = config['FILE']['context_prompt_file']
    # config_dict['context_prompt_file'] = context_prompt_file

    # Reading llm_name value
    llm_name = config['FILE']['llm_name']
    config_dict['llm_name'] = llm_name

    # Reading table_names value
    # table_name = config['FILE']['table_name'].strip().split(',')
    # config_dict['table_name'] = table_name

    # Reading sql_data value
    sql_dataset = config['FILE']['sql_dataset']
    config_dict['sql_dataset'] = sql_dataset

    # Reading sampling_path value
    samples_path = config['PATH']['samples_path']
    config_dict['samples_path'] = samples_path

    # Reading sampling_size value
    sampling_file = config['FILE']['sampling_file']
    config_dict['sampling_file'] = sampling_file


    # printing the config data
    if config_dict['debug']:
        print("\n## Inside read_config [read_config()] ##")
        for i in config_dict:
            print(str(i),':',str(config_dict[i]))

    # returning the congig_dict [dictonary]
    return config_dict
