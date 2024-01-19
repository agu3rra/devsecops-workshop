"""Evaluates our version command""" 
from click.testing import CliRunner, Result
from .common import runner, assert_result

import mbt


def test_version(runner: CliRunner):
    """Evaluates if our version output is ok"""
    result: Result = runner.invoke(mbt.version)
    print(result.output)
    assert_result(result, mbt.ExitCodes.SUCCESS.value, "version: ")