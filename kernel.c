void kmain(void){
	const char *str = "My First Kernel";
	char *vidptr = (char*)0Xb8000; //video memory begins
	
	unsigned int i = 0;
	unsigned int j = 0;

	while(j < 80*25*2){
		/* blank character */
		vidptr[j] = ' ';
		vidptr[j+1] = 0x07;
		j = j+2;
	}

	j = 0;
	
	while(str[j]!='\0'){
		vidptr[i] = str[j];
		vidptr[i+1]=0x07;
		++j;
		i = i+2;
	}
	return;
}	
