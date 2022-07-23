import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge


@cocotb.test()
async def lfsr_tb(dut):
    # create clock
    cocotb.fork(Clock(dut.clk, 10, units='ns').start())
    # make reset to 0 and wait for 10ns and then make it to 1
    dut.reset.value = 0
    await FallingEdge(dut.clk)
    dut.reset.value = 1
    dut.seed.value = 1
    count = 0
    while await FallingEdge(dut.clk):
        cocotb.log.info(f"clk={dut.clk.value},out={hex(dut.out.value)}")
        if count == 30:
            break
        count += 1
