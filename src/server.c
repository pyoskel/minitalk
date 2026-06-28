/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pabartoc <pabartoc@student.42heilbronn.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/06/26 06:29:18 by pabartoc          #+#    #+#             */
/*   Updated: 2026/06/28 09:28:49 by pabartoc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"
#include "ft_printf.h"

int	main(void)
{
	ft_printf("Server PID = %d" getpid());
	return (EXIT_SUCCESS);
}
