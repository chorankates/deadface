#!/bin/env python
## angr-template.py - really just need 5 pieces of information

import angr
import claripy

binary = './deadface_re01.bin'

# get these from decompilation/ghidra
base_addr        = 0x00100000
max_input_length = 10
success_addr     = 0x001010cc
failure_addr     = 0x00101161

r = max_input_length

while r > 0:
  r -= 1
  print("round[%d]" % r)
  ## boilerplate.. that does the actual work
  proj = angr.Project(binary, main_opts={'base_addr': base_addr}, load_options={"auto_load_libs": False})


  input_chars = [claripy.BVS("char_%d" % i, 8) for i in range(r)] # creating a symbolic bit vector for each character. why '8' though?
  input = claripy.Concat(*input_chars) # TIL python exposes pointers

  entry_state = proj.factory.entry_state(args=[binary], stdin=input) # not sure why need to specify args if they are the same as the proj initialization

  for byte in input_chars:
    entry_state.solver.add(byte >= 0xa, byte <= 0x7e) # was char ordinals from 32 - 126, so printable ASCII, expanded now

  simulation = proj.factory.simulation_manager(entry_state)

  # Finding a state that reaches `success_addr`, while discarding all states that go through `failure_addr`
  simulation.explore(find = success_addr, avoid = failure_addr)

  if len(simulation.found) > 0:
    solution = simulation.found[0]
    print(solution.solver.eval(input, cast_to=bytes)) # jesus i hate python so much
    break
  else:
    print("  no solution found")

