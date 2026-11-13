# PhytoScope 参考数据仓库（phytoscope-reference-data）

本目录保存 PhytoScope 软件仓库**当前检出版本**中不再内置的完整参考数据。
软件仓库只保留 KB 级小示例与可追溯索引；本仓库是完整数据的**权威副本**。

> **交付状态（请如实转述）**：完整参考数据已迁移至独立数据仓库 —— **本地目录已就绪，
> 远端地址待用户提供**。本仓库尚未推送到 gitee / github；两个平台各创建一个**空仓库**
> （不要初始化 README）并把地址提供给维护者，或提供具备建仓权限的 token 后，
> 由 `scripts/init-and-push.*` 完成首次提交与双端推送，再回填本文档与主仓库
> `reference-provenance.json` 的 `repository` 字段。**应用内不提供下载**，不会自动取回数据。

---

## 1. 用途与版本对应

| 项 | 值 |
| --- | --- |
| 软件仓库 | <https://gitee.com/omixcore/phytoscope.git> |
| 数据被移走前的软件版本（`baseline_commit`） | `8fd01ca` |
| 剥离提交（`migration_commit`） | 提交产生后回填；当前为 `null`（见 `MANIFEST.json`） |
| 权威清单 | `MANIFEST.json`（9 条，逐文件 bytes / SHA-256 / 来源 / 许可 / baseline blob） |
| 机读校验清单 | `SHA256SUMS.txt`（严格 `<64hex><两个空格><data/相对路径>`，LF） |
| 文件总数 / 总字节 | **9 / 68,518,847 B** |
| 许可说明 | `LICENSES.md`（逐条来源，不确定处标「需确认」） |

**路径映射**：本仓库 `data/<rel>` 与主仓库
`src/main/resources/data/<rel>` 在 `8fd01ca` 处**逐字节一致**。

```
data/
├── species/arabidopsis/
│   ├── TAIR10_genomic.fna.gz
│   └── Chr1.gff3.gz … Chr5.gff3.gz
├── species/mint/
│   ├── mentha_longifolia_horsemint.gff3.gz
│   └── mentha_longifolia_expression.tsv
└── case-studies/arabidopsis-atlas/expression.tsv
```

主仓库保留了 6 个 KB 级示例、`reference-provenance.json`（索引，外迁条目带
`storage: external`）、各 `manifest.json` 与 `samples.tsv` / `source-values.tsv` 等元数据。

## 2. 校验与取回

先校验、再使用；校验失败时不要使用数据。

```bash
# 本仓库自身校验（9/9 OK）
cd phytoscope-reference-data
sha256sum -c SHA256SUMS.txt
# 或
./scripts/verify.sh
```

```powershell
# Windows PowerShell 等价
.\scripts\verify.ps1
```

```bash
# 与「删除前」的历史字节独立比对（QA 真值源，读取 git 历史 blob，不依赖工作树）
./scripts/verify-against-baseline.sh "G:/WorkBuddy/2026-10-27-22-02-43/phytoscope" 8fd01ca
```

`.gitattributes` 使用 `* -text`（**不得照抄主仓库的 `* text=auto eol=lf`**），
避免 Windows 检出时对 `.tsv` 做换行符转换而破坏 SHA-256。

**取回方式**：直接复制 `data/` 下需要的文件到本机任意位置，在 PhytoScope 中通过
`File → Import annotation…` / `File → Import expression matrix…` /
`File → Import genome FASTA…` 导入。应用**没有**按需下载或读取远程清单的能力，
也不需要本仓库被放到特定路径。

## 3. 序列提取：用户自带 FASTA

主仓库默认示例（拟南芥 5.5 KB 子集）**不再内置基因组 FASTA**。Gene Details →
Sequences 与研究模块的序列提取在 `isLoaded() == false` 时显示明确空状态，
不会返回空串、占位序列或借用其他组装的序列。要提取序列，请从本仓库取得
`data/species/arabidopsis/TAIR10_genomic.fna.gz`，通过
`File → Import genome FASTA…` 导入。TAIR10 record id 为 `1`–`5`、`Mt`、`Pt`，
与小示例 `##sequence-region` 的 `1`–`5` 天然一致；导入后状态栏会报告染色体名
覆盖情况与 WARNING。**切换数据集后需重新导入**。

## 4. 旧完整案例的可选复现（R11，仅研究用途）

若需复现旧版「完整拟南芥 chr1–chr5 + E-MTAB-7978 + TAIR10 FASTA」或
「完整 horsemint 注释 + 4 叶 TPM」案例，可把文件按 `path_mapping.rule` 拷回
主仓库 `src/main/resources/data/` 用于本地研究：

```bash
./scripts/restore-to-app.sh "G:/WorkBuddy/.../phytoscope"            # 默认 dry-run，只打印
./scripts/restore-to-app.sh "G:/WorkBuddy/.../phytoscope" --apply     # 实际复制
```

脚本**先校验、后复制**，默认不写入，且**不执行 `git add` / `git commit`**。
这些文件不属于软件仓库的当前版本，复现结果不应提交回软件仓库。
依赖完整数据的验证/基准数字属于 `8fd01ca` 时代的**历史结果**，需外迁数据复现，
不得当作当前版本的实测值。

## 5. 双平台镜像与远端

`scripts/init-and-push.sh <gitee-url> <github-url>` /
`scripts/init-and-push.ps1 <gitee-url> <github-url>` 用于在本目录执行 `git init`、
首次提交、添加 `gitee` / `github` 两个远端并推送**同一提交**（互为镜像）。

> **远端仓库需用户事先在网页创建（或提供具备建仓权限的 token）**；脚本只接收
> **已存在的空仓库 URL** 作为参数，不调用任何平台 API、不尝试创建仓库。
> gitee 侧为 HTTPS + credential manager，github 侧为 SSH 别名，二者仅能推送到
> 已存在仓库。当前 `MANIFEST.json` 的 `mirror_repositories.gitee/github` 均为 `null`。

## 6. 体积与历史的严谨边界（不要夸大）

- 本次只从软件仓库**当前检出版本**用普通 `git rm` + 一次新提交移除 9 个文件；
  **未改写任何 git 历史**，`8fd01ca` 及其全部 blob 仍在对象库中，
  误删可用 `git restore --source=8fd01ca -- <path>` 逐文件恢复。
- 因此**只有软件仓库当前检出工作树与构建产物（jar / jlink ZIP）变小**；
  **git 历史 pack（约 209 MiB）与全新克隆体积不变**，也不存在「克隆更快」的说法。
- 软件仓库中另有 4 个范围外大文件（`benchmark-results/parsed-structure.tsv`、
  `examples/arabidopsis-isoform-validation/uniprot-domains.tsv`、
  `src/test/resources/non-model/vigna-umbellata/public-expression.tsv`、
  `examples/arabidopsis-atlas/expression.tsv`）本次**未动**，仅登记为已知遗留。

## 7. 待用户配合事项单

1. 在 gitee 与 github **各创建一个空仓库**（建议同名 `phytoscope-reference-data`，
   不要初始化 README），提供两个地址；或提供具备 `create_repo` 权限的 token。
2. 运行 `scripts/init-and-push.* <gitee-url> <github-url>` 完成首次提交与双端推送。
3. 把两个地址回填到本仓库 `MANIFEST.json` 的 `mirror_repositories`、
   主仓库 `reference-provenance.json` 的 `external_repository`，并回填
   `migration_commit` / `moved_at_commit`（当前为 `null`）。
4. 需要复核的许可（尤其 `mentha_longifolia_expression.tsv` 的来源与许可，
   以及 figshare 条目的 CC BY 4.0）按 `LICENSES.md` 逐条确认后再分发。
