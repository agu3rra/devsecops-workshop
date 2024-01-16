"""This Azure Function will write data into Azure Blob Storage (ABS) whenever 
it is called"""


def log_event(data_b64: str, upload_path: str) -> bool:
    """logs the received data input into the provided upload path

    Args:
        data (str): base64 encoded log entry
        upload_path (str): upload path in ABS

    Returns:
        bool: True on success; False otherwise;
    """
    # TODO implement
    pass