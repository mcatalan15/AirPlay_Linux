#!/usr/bin/env python3

import socket
import binascii

def wake_on_lan(mac_address):
    # Create a socket
    udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp_socket.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

    # Create magic packet
    mac_bytes = binascii.unhexlify(mac_address.replace(':', '')) # Convert MAC address to bytes
    magic_packet = b'\xFF' * 6 + mac_bytes * 16

    # Send magic packet
    udp_socket.sendto(magic_packet, ('255.255.255.255', 9))
    udp_socket.close()

if __name__ == '__main__':
    # Replace 'XX:XX:XX:XX:XX:XX' with the MAC address of the target computer
    mac_address = 'F8:CA:B8:32:8D:E7'
    wake_on_lan(mac_address)

