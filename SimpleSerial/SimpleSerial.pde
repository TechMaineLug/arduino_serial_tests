/*
  Simple serial testing. Echos back characters all characters that
  have been received when a LF or ':' is encountered.
*/

#define BUFFER_SIZE 128
#define MAX_RX_CHARS (BUFFER_SIZE - 2)

int serial_pos;
char serial_buffer[BUFFER_SIZE];


void setup()
{
  Serial.begin(115200);
}

void loop()
{
  char c;
  
  if (Serial.available() > 0) {
    c = Serial.read();
    
    if (c == '\n' || c == ':') {
      serial_buffer[serial_pos] = 0;
      Serial.println(serial_buffer);
      serial_pos = 0;
    }
    else {
      serial_buffer[serial_pos] = c;
      serial_pos++;
      
      if (serial_pos >= MAX_RX_CHARS)
        serial_pos = 0;
    }
  }
}

