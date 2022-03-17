from tabulate import tabulate

def print_select(query, col_names = None):
    print(tabulate(query, headers = col_names))
