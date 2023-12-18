require "uart"

val=1
direction=0
UART.open('/dev/ttyUSB1',19200, '8N1') do |serial|
  while true
    val = direction.zero? ? val << 1 : val >> 1
    direction ^=1 if (val > 2**8 or val==1) # changement de direction (xor)
    serial.write [val].pack 'C'
    sleep 0.05
  end
end
