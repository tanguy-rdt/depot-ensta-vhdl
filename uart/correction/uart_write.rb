require "uart"

UART.open('/dev/ttyUSB1',19200, '8N1') do |serial|
  while true
    print "enter a value > "
    val=$stdin.gets.chomp.to_i
    serial.write [val].pack 'C'
  end
end
