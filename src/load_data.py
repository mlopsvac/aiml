import os
import yaml
import pandas as pd
import numpy as np
import argparse
from pkgutil import get_data
from get_data import get_data, read_param





if __name__ == "__main__":
    args = argparse.ArgumentParser()
    args.add_argument("--config", default='params.yml')
    parsed_args = args.parse_args()
    load_save_data(config_path = parsed_args.config)