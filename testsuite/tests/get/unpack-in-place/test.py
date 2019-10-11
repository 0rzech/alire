"""
Test init command produced artifacts and options
"""

from drivers.alr import run_alr
from drivers.asserts import assert_eq
from drivers.helpers import compare, contents

# Get crate from tarball and check contents
run_alr('get', 'libhello=1.0.0-tarball')
compare(contents('libhello_1.0.0_filesystem'),
        ['libhello_1.0.0_filesystem/alire',
         'libhello_1.0.0_filesystem/alire/alr_build.gpr',
         'libhello_1.0.0_filesystem/alire/alr_build.gpr.prev',
         'libhello_1.0.0_filesystem/alire/libhello.toml',
         'libhello_1.0.0_filesystem/libhello.gpr',
         'libhello_1.0.0_filesystem/src',
         'libhello_1.0.0_filesystem/src/libhello.adb',
         'libhello_1.0.0_filesystem/src/libhello.ads',
         ])

print('SUCCESS')
