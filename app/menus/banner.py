from colorama import Fore, Style, init
import time, sys

init(autoreset=True)

def slow_print(text, delay=0.0015):
    for char in text:
        sys.stdout.write(char)
        sys.stdout.flush()
        time.sleep(delay)
    print()

def show_banner():
    banner = [
        f"{Fore.CYAN}██╗  ██╗ ██████╗ ██████╗ ██╗   ██╗██╗   ██╗",
        f"{Fore.CYAN}██║  ██║██╔═══██╗██╔══██╗██║  ██║ ██║   ██║",
        f"{Fore.CYAN}███████║██║   ██║██████╔╝.  ██║.   ███████║",
        f"{Fore.CYAN}██╔══██║██║   ██║██.██ ╔═══ ██╔═║.   ██║",
        f"{Fore.CYAN}██║  ██║╚██████╔╝██║ ███  ██║ ██║.   ██║",
        f"{Fore.CYAN}╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ",
        "",
        f"{Fore.MAGENTA}         HORXY CLI • Secure & Simple",
        f"{Fore.WHITE}────────────────────────────────────────────",
    ]

    for line in banner:
        slow_print(line, 0.002)

if __name__ == "__main__":
    show_banner()
