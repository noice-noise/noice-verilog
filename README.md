# noice-verilog

Verilog struggles repo

## Workflow: Icarus Verilog + GTK + VSCode extension

Setting up the workflow with VSCode is not easy, but provides flexibility and portability as all these tools are open source. Proceed at your risk.

Follow-through [YouTube tutorial by godofthunder1729](https://www.youtube.com/watch?v=FqIhFxf9kFM).

### Setup Icarus Verilog

- Download current Verilog Icarus version.
- Install through `Full Installation` setup including all the necesarry modules such as the GTK wave.
- IMPORTANT: Don't forget to check `Add executable PATH` while configuring install.
- IMPORTANT: `Avoid changing the setup path` with white spaces (as indicated in the setup warning), better to leave the settings as it is.

### Install VSCode extensions:

- `Verilog HDL` by leafvmaple
  - for compiling & cxecuting as show in the tutorial
- `Verilog-HDL/SystemVerilog/Bluespec SystemVerilog` by mshr-h
  - optional - for easy Code Snippets
  - Old but working [tutorial](https://www.youtube.com/watch?v=FZ-CQ_TT_hs&t=273s) to enable extension with iVerilog

## Workflow in action

Extension test:

<p align="center">
  <img src="/screenshots/hello-world.png" alt="hello"/>
</p>

With testbench and GTK wave for simulation:

<p align="center">
  <img src="/Media/verilog-gtk-wave-running.png" alt="workflow"/>
</p>
