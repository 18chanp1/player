/**
 * A utility to convert binary music files to C formatted
 * files accepted by the DE1.
 * 
 * Usage: ./readbin
 * 
 * The music file must be named "song.bin". The C file
 * "song.c" will be saved in the same directory.
 * --------------------
 * Music file specifications:
 * 44 KHz, little endian, mono, 8-bit unsigned PCM.
*/

#include "stdio.h"
#include "stdlib.h"

#define SECONDS 30
#define SAMPLE_RATE 44000
#define SAMPLES (SECONDS * SAMPLE_RATE)

int main (void)
{
    FILE *fp;

    fp = fopen("song.bin", "rb");

    uint8_t sample [SAMPLES];
    fread(sample, sizeof(uint8_t), SAMPLES, fp);

    fclose(fp);

    FILE* cFP = fopen("song.c", "w");

    fprintf(cFP, "const unsigned int size_song=%d;\n", SAMPLES);
    fprintf(cFP, "const unsigned char song[%d]={", SAMPLES);

    for (int i = 0; i < SAMPLES - 1; i++)
    {
        fprintf(cFP, "%d,\n", sample[i]);    
    }

    fprintf(cFP, "%d", sample[SAMPLES - 1]);

    fprintf(cFP, "};");

    fclose(cFP);

    return 0;
}