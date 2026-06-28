# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pabartoc <pabartoc@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/06/28 09:18:58 by pabartoc          #+#    #+#              #
#    Updated: 2026/06/28 09:19:02 by pabartoc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Executable names
SERVER      = server
CLIENT      = client

# Compiler and flags
CC          = cc
CFLAGS      = -Wall -Wextra -Werror

# Directories
SRC_DIR     = src
OBJ_DIR     = obj
INC_DIR     = inc
PRINTF_DIR  = ft_printf

# Include paths (ensures minitalk.h and ft_printf.h are found)
INCLUDES    = -I$(INC_DIR) -I$(PRINTF_DIR)

# The compiled ft_printf library
PRINTF_LIB  = $(PRINTF_DIR)/libftprintf.a

# Source files
SERVER_SRC  = $(SRC_DIR)/server.c
CLIENT_SRC  = $(SRC_DIR)/client.c

# Object files (converts .c paths to .o paths in the obj/ directory)
SERVER_OBJ  = $(SERVER_SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
CLIENT_OBJ  = $(CLIENT_SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# ==========================================
# Rules
# ==========================================

# Default rule builds both programs
all: $(PRINTF_LIB) $(SERVER) $(CLIENT)

# Jumps into the ft_printf directory and runs 'make'
$(PRINTF_LIB):
	@$(MAKE) -C $(PRINTF_DIR)

# Compiles the server and links the ft_printf library
$(SERVER): $(SERVER_OBJ) $(PRINTF_LIB)
	$(CC) $(CFLAGS) $(SERVER_OBJ) $(PRINTF_LIB) -o $(SERVER)

# Compiles the client and links the ft_printf library
$(CLIENT): $(CLIENT_OBJ) $(PRINTF_LIB)
	$(CC) $(CFLAGS) $(CLIENT_OBJ) $(PRINTF_LIB) -o $(CLIENT)

# Compiles .c files to .o files and puts them in the obj/ directory
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Cleans object files in minitalk and in ft_printf
clean:
	@$(MAKE) clean -C $(PRINTF_DIR)
	rm -rf $(OBJ_DIR)

# Cleans executables, the library, and calls clean
fclean: clean
	@$(MAKE) fclean -C $(PRINTF_DIR)
	rm -f $(SERVER) $(CLIENT)

# Rebuilds the project entirely
re: fclean all

# Prevents conflicts with files of the same name
.PHONY: all clean fclean re