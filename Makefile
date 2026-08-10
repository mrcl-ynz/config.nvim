.PHONY: all

all: checkhealth lint format

FILES := $(shell find -name "*.lua")

checkhealth: health.log
	@ERRORS=$$(grep -E "WARNING|ERROR" $<); [ -n "$${ERRORS}" ] \
		&& { $(call msg,$${ERRORS},$(RED)); rm $<; exit 1; } \
		|| { $(call msg,"Healthcheck OK",$(GREEN)); rm $<; }

health.log:
	@$(call msg,"Running Healthcheck...",$(CYAN))
	@nvim --headless -Es "+check vim.health | w! $@ | qa!"

lint: .luacheckrc
	@$(call msg,"Linting...",$(CYAN))
	@luacheck $(FILES)

format: .stylua.toml
	@$(call msg,"Checking Format...",$(CYAN))
	@stylua -c $(FILES) && $(call msg,"Format OK",$(GREEN)) || stylua $(FILES)

# Message and colors
msg = echo "$(2)\n$(1)$(NC)"

RED = \033[0;31m
GREEN = \033[0;32m
CYAN = \033[0;36m
NC = \033[0m
