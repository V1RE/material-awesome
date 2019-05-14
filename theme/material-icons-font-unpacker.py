import sys

if len(sys.argv) < 2:
  print("Usage: python {} webfont-file.svg".format(sys.argv[0]))
  sys.exit()
with open(sys.argv[1], 'r') as r:
  lines = r.read().split('\n')
  glyphs = [x for x in lines if '<glyph' in x]
  # for every glyph element in the file
  with open("./icons/init.lua", 'w') as list:
    list.write("local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'\n\nreturn {\n")
    for i in range(0, len(glyphs)):
      name = "mdi_" + glyphs[i].split('"', 1)[1].split('"', 1)[0].replace('-', '_')
      list.write("  " + name + " = dir .. '/" + name +".svg',\n")
      with open("./icons/" + name + '.svg', 'w') as w:
        w.write('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="512" height="512" viewBox="0 0 512 512">')
        # replace 'glyph' with 'path' and flip vertically
        w.write(glyphs[i].replace('<glyph', '<path fill="#ffffff" transform="scale(1, -1) translate(0, -448)"'))
        w.write('</svg>')
    list.write("}")