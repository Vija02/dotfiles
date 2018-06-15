const inquirer = require('inquirer')
const chalk = require('chalk')
const execa = require('execa')

// Looks weird cause we need to escape the \ char -____-
console.log(
	chalk.green(
		`  _    _      _ _           _____  
 | |  | |    | | |        _|  __ \\ 
 | |__| | ___| | | ___   (_) |  | |
 |  __  |/ _ \\ | |/ _ \\   _| |  | |
 | |  | |  __/ | | (_) | (_) |__| |
 |_|  |_|\\___|_|_|\\___/    |_____/
`,
	),
)

console.log(chalk.blue(`You are about to transform this desktop into something amazing.`))
console.log(chalk.blue(`But before that, I respect your decision so choose away `) + chalk.white(`m(￢0￢)m`))
console.log()

inquirer
	.prompt([
		{
			type: 'list',
			name: 'installAll',
			message: 'Do you want to install everything?',
			choices: [{ name: 'Hell yeah!', value: true }, { name: 'Meh', value: false }],
			default: true,
		},
	])
	.then(answers => {
		if (answers.installAll) {
			console.log(
				chalk.green("Niceeee, i don't even know why I wasted time to make this prompt ") + chalk.white(`(︶︹︺)`),
			)
			console.log(chalk.yellow('Wait, actually....'))
			console.log()
			return inquirer.prompt([
				{
					type: 'list',
					name: 'bloat',
					message: 'Install bloat? (TBD)',
					choices: [{ name: 'I guess so...', value: true }, { name: 'NOOOOO', value: false }],
					default: true,
				},
			])
		} else {
			console.log(chalk.yellow('Great, more work for me ') + chalk.white(`( ¬_¬)`))
			console.log(chalk.red("Ehh, you've asked the wrong person. It's not implemented yet xD"))
		}
	})
	.then(answers => {
		if (answers.bloat) {
			console.log(chalk.green("Well, not like there's any other choice xD"))
			execa('make').stdout.pipe(process.stdout)
		} else {
			console.log(chalk.yellow('Hmm, fair enough. TBD though'))
		}
	})
