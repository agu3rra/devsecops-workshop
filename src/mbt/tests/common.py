import pytest
from click.testing import CliRunner, Result

@pytest.fixture(autouse=False)
def runner() -> CliRunner:
    """The runner we instantiate to run commands as if using the terminal

    Returns:
        CliRunner: um... a... runner
    """
    return CliRunner()


def assert_result(result: Result,
                  exit_code: int,
                  output_contains: str) -> None:
    """asserts if a result from the cli runner has the expected exit code and output

    Args:
        result (Result): click test framework Result class
        exit_code (int): expected exit code from the CLI
        output_contains (str): what we expect to be in the terminal
    """
    assert result.exit_code == exit_code
    assert result.output.find(output_contains) >= 0
