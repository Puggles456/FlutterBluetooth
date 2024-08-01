import serial
import time

# Configuration
hex_file = 'image.hex'
serial_port = 'COM7'  # Update this with your actual serial port
baud_rate = 115200

def read_hex_file(file_path):
    with open(file_path, 'r') as file:
        hex_data = file.read()
    
    data = hex_data.replace(" ", "").replace("\n", "").replace("\r", "")  # Remove spaces and newlines
    print("Data: ", data) # Print the data to the console
    print(f"Data size (hex): {len(data) // 2} bytes")
    return data

def segment_hex_data(data, chunk_size=460):
    return [data[i:i + chunk_size] for i in range(0, len(data), chunk_size)]

def send_data_via_serial(serial_port, baud_rate, data_chunks):
    total_size = 0
    start_time = time.time()  # Record the start time
    with serial.Serial(serial_port, baud_rate, timeout=1) as ser:
        for i, chunk in enumerate(data_chunks):
            chunk_start_time = time.time()  # Record the start time for this chunk
            # Convert hex chunk to binary data
            binary_chunk = bytes.fromhex(chunk)
            ser.write(binary_chunk)
            total_size += len(binary_chunk)
            time.sleep(0.001)  # Increase delay to ensure proper transmission
            
            # Read and print the echoed hex string from the Arduino
            #echoed_data = ser.readline().decode().strip()
            #print(f'Chunk {i+1}/{len(data_chunks)} - Sent {total_size} bytes')
            #print(f'Sent: {chunk}')
            #print(f'Echoed from Arduino: {echoed_data}')
            
            chunk_end_time = time.time()  # Record the end time for this chunk
            chunk_elapsed_time = chunk_end_time - chunk_start_time  # Calculate the elapsed time for this chunk
            chunk_size_kb = len(binary_chunk) / 1024.0  # Size of this chunk in KB
            chunk_transfer_rate_kbps = chunk_size_kb / chunk_elapsed_time  # Transfer rate for this chunk in KB/s
            #print(f'Chunk transfer rate: {chunk_transfer_rate_kbps:.2f} KB/s')

    end_time = time.time()  # Record the end time
    elapsed_time = end_time - start_time  # Calculate the total elapsed time
    return total_size, elapsed_time

def main():
    hex_data = read_hex_file(hex_file)
    data_chunks = segment_hex_data(hex_data)
    total_size, elapsed_time = send_data_via_serial(serial_port, baud_rate, data_chunks)
    total_size_kb = total_size / 1024.0
    transfer_rate_kbps = total_size_kb / elapsed_time  # Calculate the overall transfer rate in KB/s
    print(f'Total size sent: {total_size_kb:.2f} KB')
    print(f'Overall transfer rate: {transfer_rate_kbps:.2f} KB/s')
    print(f'Elapsed time: {elapsed_time}')

if __name__ == '__main__':
    main()
