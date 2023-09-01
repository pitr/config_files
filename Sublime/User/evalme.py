import sublime
import sublime_plugin
import subprocess
import tempfile
from os.path import expanduser

class EvalMeCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		home = expanduser("~")
		for region in self.view.sel():
			if not region.empty():
				s = self.view.substr(region)
				input = "⎕CY'dfns' ⋄ ⎕←"+s
				with tempfile.NamedTemporaryFile() as tmp:
					tmp.write(input.encode('utf-8'))
					tmp.flush()
					argv = ["/usr/local/bin/dyalogscript","ConfigFile={home}/.dyalog/dyalog.dcfg",tmp.name]
					result = subprocess.run(argv, stdout=subprocess.PIPE)
					self.view.replace(edit, region, result.stdout.decode('utf-8').strip())
