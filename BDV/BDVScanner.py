import re
import sys
import os
import glob
import os
import time
import csv


def BDV(idir, odir, s):
    start = time.time()

    for r, d, f in os.walk(idir):
        with open(str(odir) + '/' + str(s) + '_stegResults.csv', mode='a') as results_file:
            csvwriter = csv.writer(results_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
            for file in f:
                if '.MP4' or '.mp4' in file:
                    with open(str(idir)+'/'+str(file), "rb") as i:
                        stream=i.read()
                        if b'\xfb\xea\xd8\x81\x25\x0f\xf9' in stream:
                            csvwriter.writerow([str(file), 'Yes', 'BDV Steganography', 'fbead881250ff9'])
                        else:
                            csvwriter.writerow([str(file), 'No', 'None', ''])

        end = time.time()
        print(end - start)
