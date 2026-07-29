
def main():
    print("Hello from docker1!")


if __name__ == "__main__":
    main()
import matplotlib
import numpy as np
import pandas as pd
import requests
import sklearn

print("Container started successfully.")
print(f"NumPy version: {np.__version__}")
print(f"pandas version: {pd.__version__}")
print(f"scikit-learn version: {sklearn.__version__}")
print(f"Matplotlib version: {matplotlib.__version__}")
print(f"requests version: {requests.__version__}")
