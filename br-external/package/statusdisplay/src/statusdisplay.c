#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <linux/fb.h>

int main() {
    int fb = open("/dev/fb0", O_RDWR);

    struct fb_var_screeninfo info;
    ioctl(fb, FBIOGET_VSCREENINFO, &info);

    printf("Tela: %dx%d\n", info.xres, info.yres);

    int tamanho = info.xres * info.yres / 8;
    char *tela = (char*)mmap(0, tamanho, PROT_WRITE, MAP_SHARED, fb, 0);

    int linha_y = info.yres / 2;
    int bytes_por_linha = info.xres / 8;
    int posicao_linha = linha_y * bytes_por_linha;

    for (int i = 0; i < bytes_por_linha; i++) {
        tela[posicao_linha + i] = 0xFF;
    }

    printf("Desenhei uma linha!\n");
    getchar();

    close(fb);
    return 0;
}