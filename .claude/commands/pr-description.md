Generate a concise PR description based on the commits in the current branch and copy it to the clipboard using pbcopy.

Steps:
1. Run `git log main..HEAD --oneline` to see what commits are in this branch
2. Write a brief PR description in this format:
   - A `## Summary` heading
   - 1-2 sentence overview of what the PR does
   - A bullet list of the specific changes (endpoints added, classes introduced, etc.)
   - Only include what was changed in THIS branch — do not reference work from other branches
3. Copy the description to the clipboard using: `echo '<markdown>' | pbcopy`
4. Display the description to the user
