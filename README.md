# Dynamic Portfolio Git Source Control Graphic

A web-based visual representation of a Git repository's commit history. This project dynamically displays commits, branches, and merges in a visually appealing timeline. It is especially useful for tracking individual feature branches that are deleted after merging into the main branch. Currently, the project is open to contributions for handling more complex scenarios involving multiple concurrent branches.

DISCLAIMER - this project is independent and not affiliated with or endorsed by, or sponsored by the Git project or any related organization the Git project.

The project is provided "as-is" without warranty of any kind. The authors are not responsible for any damages or issues that may arise from its use.
---

## Features

- **Dynamic Commit Timeline**: Displays commits as nodes in a timeline, including branching and merging points.
- **Branch Visualization**: Tracks and visualizes branches with unique colors for better differentiation.
- **Feature Branch Tracking**: Supports visualization of feature branches that merge back into the main branch before being deleted.
- **Customizable Commit Import**: Allows manual addition of commits or automated import of commit history using a shell script.

---

## Example Usage

### 1. **Manually Adding Commits**
You can manually add commits to the timeline using the `commit` function in the embedded JavaScript code.

#### javascript Example:
``` 
commit('main', 'Merged branch-1 into main');
commit('branch-1', 'Feature development started');
commit('main', 'Initial commit');
```

This creates a timeline showing:

- An initial commit on the `main` branch.
- A feature branch `branch-1` with a commit.
- A merge back into the `main` branch.

---

## 2. Using the `git.sh` Script

Automate the generation of a commit timeline by exporting your Git repository's commit history.

### Steps:
1. Copy the `git.sh` script into your local repository's root directory.
2. Make the script executable in git bash terminal: `chmod +x git.sh`

3. Run the script:
`./git.sh`

4. The script generates a `commits.txt` file in the repository root. This file contains a consolidated commit history with branch labels.

---

## How to Use the `commits.txt` File

1. Place the `commits.txt` file in the same directory as the `index.html` file.
2. When you open the webpage in your browser, the JavaScript code will load the `commits.txt` file and render the commit timeline dynamically.

---

## Current Limitations

### Issue with Concurrent Branch Commit Visualization
The project currently does not support visualization of multiple concurrent branches with commits before merging into the `main` branch. When two or more branches have overlapping timelines, the rendering does not correctly align or separate these branches. Contributions to fix this issue are welcome.

### Known Scenarios That Work
- Tracking individual feature branches that merge back into the `main` branch before deletion works as expected.

---

## Contributions

This project is open-source and welcomes contributions to improve its functionality and features.

### Areas for Improvement
- **Concurrent Branch Commit Display**: Implement support for visually separating concurrent branches in the timeline.
- **UI Enhancements**: Improve the overall design and interactivity of the graphic.
- **Performance Optimization**: Optimize the rendering process for larger repositories with complex histories.

### How to Contribute
1. Fork the repository.
2. Create a new branch for your feature or fix:
   `git checkout -b feature/concurrent-branch-commits`
3. Make your changes and test thoroughly.
4. Submit a pull request with a detailed explanation of your changes.

### Acknowledgments

- This project is designed to provide a clean and user-friendly way to visualize Git commit histories. It's an ideal tool for portfolios, documentation, and presentations.

- We look forward to your contributions to make this project more robust and versatile!