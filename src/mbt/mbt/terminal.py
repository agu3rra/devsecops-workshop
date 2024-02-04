"""Consistent terminal output printing"""
def info(message: str) -> str:
    return f"[INFO]:      {message}"

def warning(message: str) -> str:
    return f"[WARN]:      {message}"

def error(message: str) -> str:
    return f"[ERRO]:      {message}"
