import struct


text = "Hallo! Ich bin zwar eine Bilddatei, aber ich sehe aus wie Text. Warum nur?  "


w, h = 5, 5
#rows = [[(ord(text[i-2]), ord(text[i-1]), ord(text[i]))] for i in range(2, len(text), 3)]
rows = [
        [(72, 97, 108)] + [(108, 111, 33)] + [(32, 73, 99)] + [(104, 32, 98)] + [(105, 110, 32)] + [(122, 119, 97)] + [(114, 32, 101)] + [(105, 110, 101)] + [(32, 66, 105)] + [(108, 100, 100)] + [(97, 116, 101)] + [(105, 44, 32)] + [(97, 98, 101)] + [(114, 32, 105)] + [(99, 104, 32)] + [(115, 101, 104)] + [(101, 32, 97)] + [(117, 115, 32)] + [(119, 105, 101)] + [(32, 84, 101)] + [(120, 116, 46)] + [(32, 87, 97)] + [(114, 117, 109)] + [(32, 110, 117)] + [(114, 63, 32)]
]

pixel_bytes = bytearray()
for row in reversed(rows):
    for r, g, b in row:
        pixel_bytes += bytes((r, g, b))
    while len(pixel_bytes) % 4 != 0:
        pixel_bytes += b'\x00'

size = 14 + 40 + len(pixel_bytes)
header = struct.pack('<2sIHHI', b'BM', size, 0, 0, 54)
info = struct.pack('<IIIHHIIIIII', 40, w, h, 1, 24, 0, len(pixel_bytes), 2835, 2835, 0, 0)

with open('hello.bmp', 'wb') as f:
    f.write(header + info + pixel_bytes)
