# File: run_simulation.py
# Python script to automate testing of the Verilog vending machine.

import os
import random
import subprocess

# --- Configuration ---
VERILOG_FILES = ["vending_machine.v", "vending_machine_tb.v"]
NUM_TESTS = 10

def generate_expected_output(input_sequence):
    """Calculates the expected dispense output for a given coin sequence."""
    coin_map = {'01': 5, '10': 10}
    expected_output = []
    current_sum = 0
    for coin in input_sequence:
        current_sum += coin_map[coin]
        if current_sum >= 15:
            expected_output.append('1')
            current_sum = 0  # Machine resets after dispensing
        else:
            expected_output.append('0')
    return expected_output

# --- Main Test Loop ---
mismatches = 0
print("--- Starting Vending Machine FSM Verification ---")

# Compile Verilog files once before starting the tests
try:
    compile_cmd = ["iverilog", "-o", "fsm_sim.vvp"] + VERILOG_FILES
    subprocess.run(compile_cmd, check=True, capture_output=True, text=True)
except (subprocess.CalledProcessError, FileNotFoundError) as e:
    print(f"FATAL: Verilog compilation failed. Make sure iverilog is installed.")
    print(f"Error: {e.stderr}")
    exit()

for i in range(NUM_TESTS):
    # 1. Generate a random test case
    inputs = random.choices(['01', '10'], k=random.randint(3, 8))
    expected = generate_expected_output(inputs)

    # 2. Run the simulation with the generated inputs
    with open("input.txt", "w") as f:
        f.write("\n".join(inputs))
    
    sim_cmd = ["vvp", "fsm_sim.vvp"]
    subprocess.run(sim_cmd, check=True, capture_output=True, text=True)
    
    with open("output.txt", "r") as f:
        actual = [line.strip() for line in f.readlines()]
    
    # 3. Check the result and print the status
    print(f"\nTest #{i+1}:")
    print(f"  Input    : {inputs}")
    print(f"  Expected : {expected}")
    print(f"  Actual   : {actual}")
    
    if expected == actual:
        print("  Result   : PASSED ✅")
    else:
        print("  Result   : FAILED ❌")
        mismatches += 1

print("\n--- Verification Complete ---")
print(f"Total mismatches: {mismatches}")

# Clean up the files generated during simulation
for f in ["fsm_sim.vvp", "input.txt", "output.txt"]:
    if os.path.exists(f):
        os.remove(f)