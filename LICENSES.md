# 参考数据来源与许可说明（逐条复核 · B04 三选一结论定稿版）

本文件逐条列出 `data/` 下 9 个文件的来源、发布版本与**许可复核 / 再分发决策结论**，与
`MANIFEST.json`（`license_decision*` 字段）及 `docs/fcs-data-license-decision.md` 主表
**逐条一一对应**。复核 / 取证日期：**2026-11-14**（ISO-8601）。复核方式：逐一访问官方页面
（TAIR / Phoenix Bioinformatics、Ensembl、EMBL-EBI、figshare）取证。**凡无法在线确证者一律
保留「需确认」并注明原因，不编造许可条款、不臆造 `source_url`**。本文件是说明性文档，
不构成法律意见；再分发前请自行核对各数据提供方的最新使用条款。

> **结论 ≠ 已获授权；本机不能代替权利人授予许可。**
> §0 的三选一结论是**再分发决策定稿**，不是「已取得授权」「许可问题已解决」「已获书面许可」。
> 8 条 `license_status` 一律保持 `needs_confirmation`，每条 `conclusion_is_authorization = false`、
> `baseline_changed = false`。取得书面许可、Zenodo 发布、DOI 回填、薄荷 TPM 删除决策均属
> **作者 / 主理人动作（B 类）**，不由本机完成。权威决策表见 `docs/fcs-data-license-decision.md`。

**结论速览**：9 个文件中 **1 条已确证**（horsemint 注释 **CC BY 4.0**，figshare 官方 API 确证，
`decision = redistribute`）；**8 条三选一结论已定稿**（`author_authorization_required` **7 条** +
`replace_required` **1 条**），但均**仍需作者向权利人确认 / 授权**，不是已获授权。
其中 mint 4 叶 TPM 矩阵**来源与许可均无法确证，为硬缺口**：定稿「**来源与许可无法确证 →
不得再分发，需作者追根或删除**」。合计稳定口径 **1 confirmed + 8 待确认**。

**本次未删除任何文件、未改变基线**：9 个数据文件 / 68,518,847 B / `SHA256SUMS.txt` /
`scripts/**` / 逐文件 `sha256` / `bytes` / `path` / `source_url` / `baseline_blob` 全部不动，
`sha256sum -c SHA256SUMS.txt` 仍 9/9 OK；`MANIFEST.json` 的 `totals.files = 9`、
`totals.bytes = 68518847`、`len(files) = 9` 保持不变（`totals_unchanged = true`）。

---

## 0. B04 三选一结论定稿表（权威；与 `MANIFEST.json` 逐条一一对应）

`decision` 枚举（设计 §3.3）：`redistribute`（可分发）/ `replace_required`（需替换 / 追根）/
`author_authorization_required`（需作者向权利人申请书面许可）。`id` 1–8 对应 `MANIFEST.json`
中 8 条 `license_status = needs_confirmation` 的文件；`path` 与 `MANIFEST.json` 的 `path`
**完全一致**。`evidence_date` 与 `MANIFEST.json` 的 `license_decision_date` 同为 `2026-11-14`。

| `id` | `path` | `decision` | `official_terms_url` | `evidence_date` | `conclusion` | `author_action_id` | `conclusion_is_authorization` | `baseline_changed` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | `data/species/arabidopsis/Chr1.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 需向 Phoenix/TAIR 申请书面许可，或后续版本再替换为 NCBI RefSeq（CP002684–CP002688 / INSDC）；**本次不替换** | A2 | `false` | `false` |
| 2 | `data/species/arabidopsis/Chr2.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 同 #1；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换 NCBI RefSeq CP002684–CP002688；**本次不替换** | A2 | `false` | `false` |
| 3 | `data/species/arabidopsis/Chr3.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 同 #1；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换 NCBI RefSeq CP002684–CP002688；**本次不替换** | A2 | `false` | `false` |
| 4 | `data/species/arabidopsis/Chr4.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 同 #1；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换 NCBI RefSeq CP002684–CP002688；**本次不替换** | A2 | `false` | `false` |
| 5 | `data/species/arabidopsis/Chr5.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 同 #1；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换 NCBI RefSeq CP002684–CP002688；**本次不替换** | A2 | `false` | `false` |
| 6 | `data/species/arabidopsis/TAIR10_genomic.fna.gz` | `author_authorization_required` | <https://www.ensembl.org/info/about/legal/disclaimer.html> | 2026-11-14 | Ensembl 官方 disclaimer 明示第三方数据约束责任在用户；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换为 NCBI RefSeq（INSDC）；**本次不替换、不改 SHA-256 与金标准基线** | A2 | `false` | `false` |
| 7 | `data/case-studies/arabidopsis-atlas/expression.tsv` | `author_authorization_required` | <https://www.ebi.ac.uk/about/terms-of-use> | 2026-11-14 | 需向数据所有者确认许可（Mergner / TUM）；或作者拍板按「EBI 无额外限制 + 引用 DOI 10.1038/s41586-020-2094-2」使用。EBI 层「无额外限制」可确证，但记录无 License 字段、所有者许可缺省 | A3 | `false` | `false` |
| 8 | `data/species/mint/mentha_longifolia_expression.tsv` | `replace_required` | `N/A（来源与许可均无法确证，不臆造 source_url / 条款 URL）` | 2026-11-14 | **来源与许可无法确证 → 不得再分发，需作者追根或删除**。figshare 条目文件清单中不存在任何 TPM / 表达矩阵文件，MANIFEST 的 `source_url` 指向基因组组装页而非本矩阵；**不删除、字节不动、不臆造 `source_url`**，删除与否留给作者 | A4 | `false` | `false` |

**统计**：`author_authorization_required` **7 条**（#1–#7）、`replace_required` **1 条**（#8）、
`redistribute` **0 条**（8 条待确认中无可直接分发项）。

### 0.1 已确证项（不计入 8 条，见 §4 取证正文）

| `path` | 许可 | `decision` | `license_status` | `evidence_date` | `conclusion_is_authorization` | `baseline_changed` |
| --- | --- | --- | --- | --- | --- | --- |
| `data/species/mint/mentha_longifolia_horsemint.gff3.gz` | **CC BY 4.0**（figshare 官方 API `license` 字段确证，DOI 10.6084/m9.figshare.28457522.v3） | `redistribute` | `confirmed` | 2026-11-14 | `false` | `false` |

> 说明：已确证项的 `conclusion_is_authorization` 同样写 `false` —— 因为「CC BY 4.0 已确证」
> 是**对许可条款的核实结论**，不等于「本机代表权利人完成授权动作」。全表 9 条该字段一律 `false`。

### 0.2 Zenodo Deposit B 的 license 影响（裁定 3）

- **Deposit B（数据）license 必须选「Other（多许可）+ 引用 `LICENSES.md`」**，逐条列
  1 confirmed（CC BY 4.0）+ 8 待确认。
- **8 条 `needs_confirmation` 未定稿 / 未获权利人书面许可前，不得归并成 CC BY 4.0**。
  即使本批三选一结论已定稿，`license_status` 仍为 `needs_confirmation`，故**仍不得归并**。
- **Deposit A（软件）license = MIT**（仓库根 `LICENSE`），与数据许可分开。
- 见 `docs/zenodo-deposit-checklist.md` §5。

---

## 1. Arabidopsis thaliana · TAIR10 全基因组 FASTA

- 文件：`data/species/arabidopsis/TAIR10_genomic.fna.gz`
- 来源：Ensembl Plants **release 62**，TAIR10 组装的 toplevel DNA FASTA
- 原始 URL：<https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-62/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz>
- 复核结论：**⚠️ 仍需确认**。Ensembl 官方 disclaimer 明文区分两类数据：

  > "Ensembl imposes no restrictions on access to, or use of, the data provided …
  > Ensembl data generated by members of the project are available without restriction."

  但同一页**明确声明**：「Some of the data and software included in the distribution may be
  subject to third-party constraints. Users … are solely responsible for establishing the nature of
  and complying with any such restrictions.」**TAIR10 基因组 FASTA 是第三方（TAIR/AGI）数据**，
  即使从 Ensembl Plants r62 下载，第三方约束确认责任在用户。故 `license_status` 为
  `needs_confirmation`：应按 TAIR 条款复核，或改用 NCBI RefSeq 的 TAIR10 染色体序列
  （INSDC 开放数据、无再分发限制）作为更稳妥的等价来源。
- 官方 URL：<https://www.ensembl.org/info/about/legal/disclaimer.html>
- **B04 定稿**：`decision = author_authorization_required`，`id = 6`（见 §0）。

## 2. Arabidopsis thaliana · Araport11 完整核基因组注释（Chr1–Chr5，5 个文件）

- 文件：`data/species/arabidopsis/Chr1.gff3.gz` … `Chr5.gff3.gz`（5 个）
- 来源：**TAIR / Araport11 original June 2016 release**（TAIR10 组装）
- 原始 URL：<https://www.arabidopsis.org/download_files/Genes/Araport11_genome_release/Araport11_GFF3_genes_transposons.201606.gff.gz>
- 复核结论：**⚠️ 仍需确认（含再分发风险）**。TAIR 下载页目录结构证实 `Genes`、`Public Data
  Releases`、`Subscriber Data Releases` 是平级顶层分类；Araport11 GFF3 位于
  `Genes/Araport11_genome_release/`，**不在 `Public_Data_Releases` 下，不适用 CC BY 4.0**。
  适用 TAIR 通用 Terms of Use：可学术/非营利使用、可基于数据创作并自由再分发作品，但
  **「再分发 substantial subsets 需 Phoenix 书面许可」且限非商业**。本仓库再分发整组 Chr1–Chr5
  注释是否构成 substantial subset 需作者向 Phoenix/TAIR 确认。**更稳妥的替换来源**：NCBI RefSeq
  染色体序列 **CP002684–CP002688**（INSDC 开放数据、无再分发限制）。
- 官方 URL：<https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use>
- **B04 定稿**：5 条各自 `decision = author_authorization_required`，`id = 1–5`（见 §0）。

## 3. Arabidopsis thaliana · E-MTAB-7978 表达图谱矩阵

- 文件：`data/case-studies/arabidopsis-atlas/expression.tsv`
- 来源：**EBI Expression Atlas E-MTAB-7978**「Arabidopsis tissue atlas」（RNA-Seq baseline）
- 原始 URL：<https://ftp.ebi.ac.uk/pub/databases/microarray/data/atlas/experiments/E-MTAB-7978/E-MTAB-7978-tpms.tsv>
- 关联文献：Mergner J et al. (2020) *Mass-spectrometry-based draft of the Arabidopsis
  proteome.* Nature, DOI **10.1038/s41586-020-2094-2**
- 复核结论：**⚠️ 仍需确认（EBI 层已确证，数据所有者许可未声明）**。EMBL-EBI 使用条款明文：
  「EMBL-EBI imposes no additional restriction on the use of the contributed data than those
  provided by the data owner」并期望按良好科学实践标注来源；但 ArrayExpress / BioStudies 记录中
  **无 License 字段、无数据重用条款**，数据所有者（Mergner / Kuster, TUM）未声明具体许可。
  因此 EBI 层「无额外限制」可确证，但所有者层面许可缺省。建议作者：标注 EBI 来源 + 引用
  DOI 10.1038/s41586-020-2094-2，或向提交者 julia.mergner@tum.de 确认。
- 官方 URL：<https://www.ebi.ac.uk/about/terms-of-use>
- **B04 定稿**：`decision = author_authorization_required`，`id = 7`（见 §0）。

## 4. Mentha longifolia · 完整 horsemint 基因组注释

- 文件：`data/species/mint/mentha_longifolia_horsemint.gff3.gz`
- 来源：Lieberman, Henry & Comai (2025)，染色体级二倍体 horsemint 基因组，figshare
  **10.6084/m9.figshare.28457522**（v3），源文件为 GTF `Long3_HAP_v2.gtf.gz`
  （figshare file id 52521323）
- 原始 URL：<https://ndownloader.figshare.com/files/52521323>
- 复核结论：**✅ 已确证 CC BY 4.0**。figshare 官方公开 API 的 `license` 字段返回 `CC BY 4.0`
  （value=1，<https://creativecommons.org/licenses/by/4.0/>），主仓库 provenance 亦记为 CC BY 4.0。
  许可写死为 **CC BY 4.0**。
- 官方 URL：<https://doi.org/10.6084/m9.figshare.28457522.v3>（figshare item，license 字段）
- **B04 定稿**：`decision = redistribute`，`license_status = confirmed`（见 §0.1）。

## 5. Mentha longifolia · 4 叶 TPM 表达矩阵

- 文件：`data/species/mint/mentha_longifolia_expression.tsv`
- 来源：**无法确证（硬缺口）**。figshare 条目 10.6084/m9.figshare.28457522 的文件清单
  （基因组 FASTA、CDS、GTF、功能注释、两条 Omicsbox 注释）中**不存在任何 TPM/表达矩阵文件**；
  因此 MANIFEST 中指向该 figshare DOI 的 `source_url` 实为基因组组装页，**不代表本矩阵的来源**。
  主仓库 provenance 亦未记录本矩阵的独立下载 URL、原始 RNA-seq 文库编号或生成脚本。
- 复核结论：**❌ 来源与许可均无法确证**。**B04 定稿**：「**来源与许可无法确证 → 不得再分发，
  需作者追根或删除**」；在作者追根到明确来源与许可之前，不应再分发或声称其许可；投稿材料中
  应如实标注「来源未明确」并单列。**不删除、字节不动、不臆造 `source_url`**，删除与否留给作者（A4）。
- 关联页面（仅基因组来源，非本矩阵来源）：<https://doi.org/10.6084/m9.figshare.28457522>
- **B04 定稿**：`decision = replace_required`，`id = 8`（见 §0）。

## 6. WSU Mint Genome Resources（小示例出处，非本仓库文件）

- 主仓库保留的 KB 级示例 `species/mint/mentha_longifolia_chromosomes.gff3` 来自
  **WSU Mint Genome Resources**（Lange lab）`Mlong_CMEN585_v3.01b` Maker GFF3，
  同一组装亦存于 INSDC `GCA_001642375.2`。
- 来源页：<http://langelabtools.wsu.edu/mgr/sites/default/files/downloads/Mlong585_v3.01b-maker.gff>
- 许可：**⚠️ 仍需确认**。此处登记仅为完整说明「mint」数据来源；该文件不在本数据仓库中，
  仍随软件仓库以 KB 级示例形式保留。如需在论文中引用，需确认其许可。

---

## 汇总表（逐条复核结论，与 §0 一致）

| `path`（对应 MANIFEST `files[].path`） | 发布版本 | `decision` | 许可复核结论 | `license_status` |
| --- | --- | --- | --- | --- |
| `data/species/arabidopsis/TAIR10_genomic.fna.gz` | Ensembl Plants r62 | `author_authorization_required` | ⚠️ 需确认：Ensembl 对第三方数据不确认约束；TAIR10 属 TAIR/AGI，需向 Phoenix/TAIR 申请书面许可或后续版本换 NCBI RefSeq | `needs_confirmation` |
| `data/species/arabidopsis/Chr1.gff3.gz` | TAIR / Araport11 June 2016 | `author_authorization_required` | ⚠️ 需确认：TAIR 通用条款（非商用；substantial subset 再分发需书面许可；**非 CC BY 4.0**）；后续版本建议换 NCBI RefSeq CP002684–CP002688 | `needs_confirmation` |
| `data/species/arabidopsis/Chr2.gff3.gz` | 同上 | `author_authorization_required` | 同上 | `needs_confirmation` |
| `data/species/arabidopsis/Chr3.gff3.gz` | 同上 | `author_authorization_required` | 同上 | `needs_confirmation` |
| `data/species/arabidopsis/Chr4.gff3.gz` | 同上 | `author_authorization_required` | 同上 | `needs_confirmation` |
| `data/species/arabidopsis/Chr5.gff3.gz` | 同上 | `author_authorization_required` | 同上 | `needs_confirmation` |
| `data/case-studies/arabidopsis-atlas/expression.tsv` | EBI Expression Atlas / DOI 10.1038/s41586-020-2094-2 | `author_authorization_required` | ⚠️ 需确认：EBI「无额外限制」已确证，但记录无所有者许可，需向数据所有者（Mergner / TUM）确认 | `needs_confirmation` |
| `data/species/mint/mentha_longifolia_horsemint.gff3.gz` | figshare 10.6084/m9.figshare.28457522.v3 | `redistribute` | ✅ 已确证：**CC BY 4.0**（figshare API） | `confirmed` |
| `data/species/mint/mentha_longifolia_expression.tsv` | 来源未明确 | `replace_required` | ❌ **来源与许可无法确证 → 不得再分发，需作者追根或删除**（硬缺口） | `needs_confirmation` |

> 另：WSU Mint Genome Resources 小示例（KB 级、随主仓保留、**不在本数据仓库**）许可仍需确认，
> 不列入本表 9 条；如需在论文中引用，需确认其许可。

## 给作者的授权 / 替换请求清单（A2 / A3 / A4，B 类；完整版见 `docs/fcs-data-license-decision.md` §3）

1. **A2 · Araport11 Chr1–Chr5 + TAIR10 FASTA（6 文件，§0 #1–#6）**：向 Phoenix Bioinformatics /
   TAIR 申请「再分发 substantial subsets」的**书面许可**；**或** 拍板在**后续版本**改用 NCBI RefSeq
   染色体序列 **CP002684–CP002688**（INSDC 开放数据、无再分发限制）。替换会改变 6 个文件的
   SHA-256 与字节数，从而改变 9 文件 / 68,518,847 B 基线、`SHA256SUMS.txt`、金标准测试基线、
   Figure 5(c)、补表 S1、论文 Data Availability 数字与 Zenodo Deposit B；**故本次不替换**。
2. **A3 · E-MTAB-7978（§0 #7）**：向数据所有者确认许可（提交者 `julia.mergner@tum.de`，
   Mergner / Kuster, TUM）；**或** 拍板按「EBI 无额外限制 + 引用 DOI 10.1038/s41586-020-2094-2
   并标注 EBI 来源」使用。仅需补齐所有者许可声明 / 引用，**不改变文件字节与基线**。
3. **A4 · mint 4 叶 TPM（§0 #8）**：追根该矩阵**真实来源与许可**（原始 RNA-seq 文库编号、
   生成脚本、发布页）；**或** 拍板**删除**该文件。**禁止编造 `source_url` / 许可**。若删除，
   需从数据仓库 9 文件 / `MANIFEST.json` / `SHA256SUMS.txt` / 论文补表 S1 / Figure 5(c) /
   Zenodo Deposit B **一并移除**；**本次不删除、字节不动**。
4. **软件侧署名一致性**：确认论文署名作者（Song X, Chen P, Liang F）与 git 提交身份
   （`omixcore`）一致。
5. **WSU Mint Genome Resources 小示例**（仅登记，非本仓库文件）：如需在论文中引用，确认其许可。

> 所有条目的 SHA-256 均在 T01 由文件实际字节**重新计算**，见 `SHA256SUMS.txt`；
> 主仓库 `reference-provenance.json` 中记录的哈希仅作交叉参考，未被照抄。
> **B04 未重算任何哈希、未改动任何数据文件字节**；`sha256sum -c SHA256SUMS.txt` 仍 9/9 OK。
