# GitHub小组合作说明文档

## 小组合作开发说明

本次实践项目由小组成员利用 GitHub 进行合作开发，具体选用了 GitHub 的 `Branch` 功能进行协同开发，开发流程与分工主要由 `lihan3238` 设计与管理，`DaleChu` 协同设计与管理，其他小组成员参与。

## 基于 Github Branch 的合作开发设计

### 分支说明

- `master` 分支：主分支，用于发布稳定版本；
- `lihan3238` 分支：`lihan3238` 的开发分支；
- `DaleChu` 分支：`DaleChu` 的开发分支；
- `dracuspicy` 分支：`dracuspicy` 的开发分支；
- `DoubleJ` 分支：`DoubleJ` 的开发分支；

### 合作开发流程

1. 在 GitHub 上创建 [项目主仓库](https://github.com/lihan3238/Network-Security-Comprehensive-Practice), 并将小组成员加入仓库协作；

2. 小组成员创建自己的开发分支，分别为 `lihan3238`、`DaleChu`、`dracuspicy`、`DoubleJ`，在自己的开发分支上进行开发；

3. 在自己的分支上完成开发后，将自己的分支通过 `Pull Reaquest` 合并到 `master` 分支；

4. 完成合并后，使用 `git rebase main` 命令将 `master` 分支的最新代码合并到自己的分支；

5. 不断重复 3、4 步骤，直到项目开发完成。

### 开发示例

- 角色：`小组成员A`、`小组成员B`、`小组成员C(仓库管理员)`、`小组成员D(仓库管理员)`

- 开发流程：

1. c0: `小组成员C(仓库管理员)` 在 GitHub 上创建 `项目主仓库` 的 `main` 分支；
2. c0: `小组成员A`、`小组成员B`、`小组成员C(仓库管理员)`、`小组成员D(仓库管理员)` 分别创建自己的开发分支，并 `git clone` 在线仓库到本地，使用 `git checkout [个人分支]` 切换到自己的开发分支；

![create_branch](../img/co_doc/create_branch.png)

3. c1: `小组成员A` 在自己本地的开发分支 `chap0x0A` 上完成开发，并 `git push` 更新到远程仓库的 `chap0x0A` ,之后在 GitHub 上发起 `Pull Request` ；
4. c2: `小组成员B` 在自己本地的开发分支 `chap0x0B` 上完成开发，并 `git push` 更新到远程仓库的 `chap0x0B` ,之后在 GitHub 上发起 `Pull Request` ；

![pull_request_1](../img/co_doc/pull_request_1.png)

![pull_request_2](../img/co_doc/pull_request_2.png)

5. c3: `小组成员C(仓库管理员)` 在 GitHub 上审核 `小组成员A`、`小组成员B` 的 `Pull Request` ，并将其合并到 `main` 分支；

![apply_pull_request_1](../img/co_doc/apply_pull_request_1.png)

![apply_pull_request_2](../img/co_doc/apply_pull_request_2.png)

6. c3: `小组成员A`、`小组成员B` 使用 `git checkout main` 切换到 `main` 分支，并使用 `git pull` 拉取最新代码，之后使用 `git checkout [个人分支]` 切换到自己的开发分支，使用 `git rebase main` 命令将 `main` 分支的最新代码合并到自己的开发分支，并 `git push` 更新到远程仓库；

- 分支示意图：

![tree](../img/co_doc/tree.png)

## 注意事项

- 请在自己的个人开发分支上开发，**请勿** 直接在 `main` 分支及他人开发分支上进行开发；
- 开发过程中如果对其他人提交的内容进行了修改，请及时通知相关开发人员，并在 `Pull Request` 时说明；
- 请在 `Pull Request` 时填写详细的 `Pull Request` 说明，方便他人审核；
- 请在 `Pull Request` 合并通过后，切换到 `main` 分支 `git pull` 拉取更新到本，之后 **切换到自己的分支下** 及时使用 `git rebase main` 命令将 `main` 分支的最新代码合并到自己的开发分支，并 `git push` 到远程仓库；
- `git commit message` 参考 ![git commit 指引](https://lihan3238.github.io/p/git_commit_info/)


