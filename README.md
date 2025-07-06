# fl-studio-wav-to-ogg

WAV sample files in FL Studio are apparently just OGG Vorbis files with a 54 byte RIFF WAV header in front of them.

All you need to do to convert these files to OGG, is remove the first 54 bytes. So this is a script that does that.

1. Put all your FL Studio wav samples in the WAV folder.
2. Double click the Windows batch script.
3. The converted OGG files will be in the OGG folder.
