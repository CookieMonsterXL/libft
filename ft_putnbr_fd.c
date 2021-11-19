#include "libft.h"
#include <unistd.h>

void	recursion(int n, int fd)
{
	char	d;

	while (n > 0)
	{
		d = (n % 10) + '0';
		n /= 10;
		recursion(n, fd);
		write(fd, &d, sizeof(char));
		n = 0;
	}
}

void	ft_putnbr_fd(int n, int fd)
{
	if (n == 0)
		write(fd, "0", 1);
	else if (n == -2147483648)
		write(fd, "-2147483648", 11);
	else if (n > 0)
		recursion(n, fd);
	else if (n < 0)
	{
		write(fd, "-", 1);
		n *= -1;
		recursion(n, fd);
	}
}

// int main(void)
// {
// 	ft_putnbr_fd(87, 1);
// }
