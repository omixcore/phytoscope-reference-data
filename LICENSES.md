# 参考数据来源与许可说明（逐条复核 · 含可执行再分发条件表）

> ## ⚠️ 醒目结论
>
> **现有数据归档包不构成已具备公开再分发条件的证据；8 项许可未落定前，Deposit B 不得设为公开可下载。**
>
> 8 项许可全部落定（取得书面许可或完成替换）之前，`phytoscope-reference-data` 的归档
> **只能是「待发布」状态**，不得在 Zenodo 设为公开可下载，不得在任何材料中称「许可已理清」
> 「可直接再分发」。**Zenodo 归档状态保持「待发布」，DOI 占位符保持未回填。**

本文件逐条列出 `data/` 下 9 个文件的来源、发布版本与**许可复核 / 再分发决策结论**，与
`MANIFEST.json`（`license_decision*` 字段）及 `docs/fcs-data-license-decision.md` 主表
**逐条一一对应**。复核 / 取证日期：**2026-11-14**（ISO-8601）。复核方式：逐一访问官方页面
（TAIR / Phoenix Bioinformatics、Ensembl、EMBL-EBI、figshare）取证，并对薄荷 4 叶 TPM
矩阵做**本机溯源重放**（见 `PROVENANCE-mint-tpm.md`）。**凡无法在线确证者一律保留「需确认」
并注明原因，不编造许可条款、不臆造 `source_url`**。本文件是说明性文档，不构成法律意见；
再分发前请自行核对各数据提供方的最新使用条款。

> **结论 ≠ 已获授权；本机不能代替权利人授予许可。**
> §0 的三选一结论是**再分发决策定稿**，不是「已取得授权」「许可问题已解决」「已获书面许可」。
> 8 条 `license_status` 一律保持 `needs_confirmation`，每条 `conclusion_is_authorization = false`、
> `baseline_changed = false`。取得书面许可、Zenodo 发布、DOI 回填、薄荷 TPM 的最终去留
> 均属**作者 / 主理人动作（B 类）**，不由本机完成。权威决策表见 `docs/fcs-data-license-decision.md`。

**结论速览**：9 个文件中 **1 条已确证**（horsemint 注释 **CC BY 4.0**，figshare 官方 API 确证，
`decision = redistribute`）；**8 条三选一结论已定稿**（`author_authorization_required` **7 条** +
`withdrawn_pending_upstream_confirmation` **1 条**），但均**仍需作者向权利人确认 / 授权**，
不是已获授权。

其中 mint 4 叶 TPM 矩阵**溯源已确证、许可未落定**：已查明它由本项目用 SRP565976 的 4 个
叶片文库读段 + 本项目 CC BY 4.0 注释自行计算得出（可复现到命令与输入，见
`PROVENANCE-mint-tpm.md`）；但上游 INSDC 读段无明示许可，故定稿「**暂不公开再分发**」，
`distribution_status = withdrawn_from_public_deposit`（**不进入公开归档包，文件保留在仓库**）。
**它已不再是「来源无法确证」**。合计稳定口径 **1 confirmed + 8 待确认**。

**本次未删除任何文件、未改变基线**：9 个数据文件 / 68,518,847 B / `SHA256SUMS.txt` /
`scripts/**` / 逐文件 `sha256` / `bytes` / `path` / `baseline_blob` 全部不动，
`sha256sum -c SHA256SUMS.txt` 仍 9/9 OK；`MANIFEST.json` 的 `totals.files = 9`、
`totals.bytes = 68518847`、`len(files) = 9` 保持不变（`totals_unchanged = true`）。
**拟归档清单（Deposit B 候选）为 8 个文件 / 65,124,010 B**（`MANIFEST.json` 的
`public_deposit_scope.candidate_deposit_files`）——仓库口径、拟归档清单口径、可公开再分发口径
是**三件不同的事**，不得混用。其中**可合法再分发的仅 1 个文件**（horsemint 注释，CC BY 4.0），
其余 7 个 `author_authorization_required` 在取得书面许可前**不得公开下载**。

---

## 0. B04 三选一结论定稿表（权威；与 `MANIFEST.json` 逐条一一对应）

`decision` 枚举（设计 §3.3 + 本次新增）：`redistribute`（可分发）/
`author_authorization_required`（需作者向权利人申请书面许可）/
`withdrawn_pending_upstream_confirmation`（**溯源已确证、上游许可待确认，暂不进入公开归档包**；
语义承接原 `replace_required` 的 A4 槽位，因溯源已查清而更名，**枚举仅新增、未删除旧值**）。
`id` 1–8 对应 `MANIFEST.json` 中 8 条 `license_status = needs_confirmation` 的文件；`path` 与
`MANIFEST.json` 的 `path` **完全一致**。`evidence_date` 与 `MANIFEST.json` 的
`license_decision_date` 同为 `2026-11-14`。

| `id` | `path` | `decision` | `official_terms_url` | `evidence_date` | `conclusion` | `author_action_id` | `conclusion_is_authorization` | `baseline_changed` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | `data/species/arabidopsis/Chr1.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 需向 Phoenix/TAIR 申请书面许可，或后续版本再替换为 NCBI RefSeq（CP002684–CP002688 / INSDC）；**本次不替换** | A2 | `false` | `false` |
| 2 | `data/species/arabidopsis/Chr2.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 同 #1；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换 NCBI RefSeq CP002684–CP002688；**本次不替换** | A2 | `false` | `false` |
| 3 | `data/species/arabidopsis/Chr3.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 同 #1；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换 NCBI RefSeq CP002684–CP002688；**本次不替换** | A2 | `false` | `false` |
| 4 | `data/species/arabidopsis/Chr4.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 同 #1；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换 NCBI RefSeq CP002684–CP002688；**本次不替换** | A2 | `false` | `false` |
| 5 | `data/species/arabidopsis/Chr5.gff3.gz` | `author_authorization_required` | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | 2026-11-14 | 同 #1；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换 NCBI RefSeq CP002684–CP002688；**本次不替换** | A2 | `false` | `false` |
| 6 | `data/species/arabidopsis/TAIR10_genomic.fna.gz` | `author_authorization_required` | <https://www.ensembl.org/info/about/legal/disclaimer.html> | 2026-11-14 | Ensembl 官方 disclaimer 明示第三方数据约束责任在用户；需向 Phoenix/TAIR 申请书面许可，或后续版本再替换为 NCBI RefSeq（INSDC）；**本次不替换、不改 SHA-256 与金标准基线** | A2 | `false` | `false` |
| 7 | `data/case-studies/arabidopsis-atlas/expression.tsv` | `author_authorization_required` | <https://www.ebi.ac.uk/about/terms-of-use> | 2026-11-14 | 需向数据所有者确认许可（Mergner / TUM）；或作者拍板按「EBI 无额外限制 + 引用 DOI 10.1038/s41586-020-2094-2」使用。EBI 层「无额外限制」可确证，但记录无 License 字段、所有者许可缺省 | A3 | `false` | `false` |
| 8 | `data/species/mint/mentha_longifolia_expression.tsv` | `withdrawn_pending_upstream_confirmation` | `N/A（读段层无 license 字段；不臆造条款 URL。上游 CC BY 4.0 条款：https://creativecommons.org/licenses/by/4.0/）` | 2026-11-14 | **溯源已确证、许可未落定 → 暂不进入公开归档包**。已查明该矩阵为本项目用 SRP565976 的 4 个叶片文库（SRR32469939/940/941/942，PI 557769）+ 本项目 CC BY 4.0 horsemint 注释自行计算（minimap2 2.28 -ax splice → featureCounts 2.0.6 -s 0 → make_tpm.py），可复现到命令，见 `PROVENANCE-mint-tpm.md`；但上游 INSDC 读段**无明示许可**，故 `distribution_status = withdrawn_from_public_deposit`。**不删除、字节不动**，文件保留供内部复现 | A4 | `false` | `false` |

**统计**：`author_authorization_required` **7 条**（#1–#7）、
`withdrawn_pending_upstream_confirmation` **1 条**（#8）、
`redistribute` **0 条**（8 条待确认中无可直接分发项）。
拟归档清单（Deposit B 候选）= **8 个文件 / 65,124,010 B**（9 个中扣留 #8，其 3,394,837 B
不计入拟归档清单；仓库 `totals` 仍为 9 / 68,518,847 B，**两者不得混用**）。
**其中可合法再分发的仅 1 个**（horsemint，见 §2.3）；#1–#7 的 7 个文件在取得书面许可前
**不得公开下载**。**「8 个文件」是拟归档的物理清单，不是「8 个可公开文件」。**

### 0.1 已确证项（不计入 8 条，见 §4 取证正文）

| `path` | 许可 | `decision` | `license_status` | `evidence_date` | `conclusion_is_authorization` | `baseline_changed` |
| --- | --- | --- | --- | --- | --- | --- |
| `data/species/mint/mentha_longifolia_horsemint.gff3.gz` | **CC BY 4.0**（figshare 官方 API `license` 字段确证，DOI 10.6084/m9.figshare.28457522.v3） | `redistribute` | `confirmed` | 2026-11-14 | `false` | `false` |

> 说明：已确证项的 `conclusion_is_authorization` 同样写 `false` —— 因为「CC BY 4.0 已确证」
> 是**对许可条款的核实结论**，不等于「本机代表权利人完成授权动作」。全表 9 条该字段一律 `false`。

### 0.2 Zenodo Deposit B 的 license 影响（裁定 3）

> **现有数据归档包不构成已具备公开再分发条件的证据；8 项许可未落定前，Deposit B 不得设为公开可下载。**

- **Deposit B（数据）license 必须选「Other（多许可）+ 引用 `LICENSES.md`」**，逐条列
  1 confirmed（CC BY 4.0）+ 8 待确认。
- **8 条 `needs_confirmation` 未定稿 / 未获权利人书面许可前，不得归并成 CC BY 4.0**。
  即使本批三选一结论已定稿，`license_status` 仍为 `needs_confirmation`，故**仍不得归并**。
- **Deposit B 拟归档清单（候选）= 8 个文件 / 65,124,010 B**：`data/species/mint/mentha_longifolia_expression.tsv`
  （#8）**不进入拟归档包**（`withdrawn_from_public_deposit`），但仍保留在仓库中供内部复现。
  **注意**：这 8 个文件里仅 1 个（horsemint）可合法再分发，其余 7 个 `author_authorization_required`
  在取得书面许可前**不得公开下载**——「8 个文件」是拟归档清单，不是「8 个可公开文件」。
- **归档状态**：Zenodo 归档保持「**待发布**」；`{{DATA_DOI}}` / `{{SOFTWARE_DOI}}` /
  `{{PAPER_DOI}}` 占位符**保持未回填**。
- **Deposit A（软件）license = MIT**（仓库根 `LICENSE`），与数据许可分开。
- 见 `docs/zenodo-deposit-checklist.md` §5 与 `docs/fcs-zenodo-handoff.md` §3。

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

- 文件：`data/species/mint/mentha_longifolia_expression.tsv`（3,394,837 B，94,883 行 × 4 样本）
- 来源：**已确证为本项目自行计算的衍生数据**（不是下载所得）。完整可复核记录见
  **`PROVENANCE-mint-tpm.md`**，摘要：
  - **读段**：NCBI BioProject **SRP565976** 的 4 个 *Mentha longifolia* 叶片文库
    **SRR32469939 / 940 / 941 / 942**（基因型 **PI 557769**，与本套组装同一材料），经 ENA 镜像
    `ftp.sra.ebi.ac.uk` 下载；
  - **参考基因组**：本项目自建 `Long3_HAP_v2` 单倍型 A、12 条染色体 `mint_A.fa`
    （上游 figshare 10.6084/m9.figshare.28457522，**CC BY 4.0**）；
  - **注释**：本仓库 `data/species/mint/mentha_longifolia_horsemint.gff3.gz`（同一条目，**CC BY 4.0**），
    经 `build_gtf.py` 转为 featureCounts 用 GTF；
  - **流程**：`sanitize_gz.py` → `minimap2 -ax splice`（`run_final.sh`）→ `samtools view -F 4`
    → `featureCounts -s 0` → `make_tpm.py`（`rpk = count/(merged exon length/1000)`，归一到 1e6）。
- **决定性对账（本次实测重跑）**：矩阵 GeneID 集合与「本仓库 GFF3 的 94,883 个基因（去 `gene:` 前缀）」
  **差异 0 行**；`mint.gtf` 唯一 `gene_id` 数 94,883、exon 355,918 行 / transcript 102,705 行；
  矩阵 4 列 ΣTPM **各为 1,000,000.00**；与 `dist/薄荷完整数据/07_表达矩阵/mint_expression_tpm.tsv`
  **逐字节相同**（SHA-256 `8000e27d…`）。第三方下载矩阵不可能出现这种零残差对齐。
- **来源更正**：原 `MANIFEST.json` 的 `source_url` 指向 figshare 组装页，**是错的**（该页文件清单中
  没有 TPM/表达矩阵）——那是**上游基因组/注释**的页面。已更正为实际下载读段所用的 ENA URL，
  原值保留在 `previous_source_url`。**未臆造任何 URL**。
- 复核结论：**⚠️ 许可未落定（溯源已确证）**。
  - 上游注释与基因组均为 **CC BY 4.0** → 这部分对公开再分发**无障碍**（需署名）。
  - 上游 **RNA-seq 读段为 INSDC 公开档案数据，ENA/SRA 记录无 license 字段**，**无明示再分发许可
    可确证**。本项目不转发任何原始读段，只分发逐基因 TPM 汇总值（94,883 × 4 个统计量，不含序列）。
  - 按保守原则：**暂不公开再分发**。`distribution_status = withdrawn_from_public_deposit`，
    `license_decision = withdrawn_pending_upstream_confirmation`，`author_action_required = A4`。
- **处置含义（务必按此表述）**：该文件**不进入** Zenodo Deposit B 拟归档清单，但**保留在仓库中**
  供内部复现与审计；**未删除、`data/**` 字节未变、`SHA256SUMS.txt` 与 `totals` 未变**。
  Deposit B 拟归档清单因此为 **8 个文件 / 65,124,010 B**（其中可公开再分发的仅 1 个 horsemint）。
- 关联页面（**仅上游基因组/注释来源，非本矩阵的来源**）：<https://doi.org/10.6084/m9.figshare.28457522>

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
| `data/species/mint/mentha_longifolia_expression.tsv` | 本项目衍生（SRP565976 读段 + CC BY 4.0 注释） | `withdrawn_pending_upstream_confirmation` | ⚠️ **溯源已确证、许可未落定**：本项目自行计算的 TPM（可复现到命令，见 `PROVENANCE-mint-tpm.md`）；上游注释/基因组 CC BY 4.0，但 INSDC 读段无明示许可 → **暂不进入公开归档包** | `needs_confirmation` |

> 另：WSU Mint Genome Resources 小示例（KB 级、随主仓保留、**不在本数据仓库**）许可仍需确认，
> 不列入本表 9 条；如需在论文中引用，需确认其许可。
>
> **拟归档清单（Deposit B）口径**：上表 9 条中，`mentha_longifolia_expression.tsv` 不进拟归档清单，
> 故拟归档清单为 **8 个文件 / 65,124,010 B**；仓库 `totals` 仍为 9 / 68,518,847 B。
> **其中可合法再分发的仅 1 个**（horsemint，CC BY 4.0）；其余 7 个 `author_authorization_required`
> 在取得书面许可前**不得公开下载**。**「8 个文件」是拟归档清单，不是「8 个可公开文件」。**

## 给作者的授权 / 替换请求清单（A2 / A3 / A4，B 类；完整版见 `docs/fcs-data-license-decision.md` §3）

1. **A2 · Araport11 Chr1–Chr5 + TAIR10 FASTA（6 文件，§0 #1–#6）**：向 Phoenix Bioinformatics /
   TAIR 申请「再分发 substantial subsets」的**书面许可**；**或** 拍板在**后续版本**改用 NCBI RefSeq
   染色体序列 **CP002684–CP002688**（INSDC 开放数据、无再分发限制）。替换会改变 6 个文件的
   SHA-256 与字节数，从而改变 9 文件 / 68,518,847 B 基线、`SHA256SUMS.txt`、金标准测试基线、
   Figure 5(c)、补表 S1、论文 Data Availability 数字与 Zenodo Deposit B；**故本次不替换**。
2. **A3 · E-MTAB-7978（§0 #7）**：向数据所有者确认许可（提交者 `julia.mergner@tum.de`，
   Mergner / Kuster, TUM）；**或** 拍板按「EBI 无额外限制 + 引用 DOI 10.1038/s41586-020-2094-2
   并标注 EBI 来源」使用。仅需补齐所有者许可声明 / 引用，**不改变文件字节与基线**。
3. **A4 · mint 4 叶 TPM（§0 #8）**：**溯源已由本机查清**（本项目用 SRP565976 的 4 个叶片文库 +
   本项目 CC BY 4.0 注释自行计算，可复现到命令，见 `PROVENANCE-mint-tpm.md`），
   **因此不再需要"追根来源"**，只剩一个许可问题，需作者三选一：
   ① **向 SRP565976 的提交者确认**：是否允许公开再分发「基于该读段的逐基因 TPM 汇总值」
      （可同时说明：不含原始读段，上游注释/基因组均为 CC BY 4.0）；
   ② **拍板按**「仅分发汇总统计量 + 完整引用 SRP565976 + 标注 CC BY 4.0 上游」处理，
      由作者/机构承担该判断；
   ③ **维持现状**（不进拟归档清单），则 Deposit B 拟归档清单永为 8 个文件。
   **无论哪种，都不要再把 figshare 组装页当作本矩阵的 `source_url`**（已更正，原值在
   `previous_source_url`）。**本次不删除、字节不动**。
4. **软件侧署名一致性**：确认论文署名作者（Song X, Chen P, Liang F）与 git 提交身份
   （`omixcore`）一致。
5. **WSU Mint Genome Resources 小示例**（仅登记，非本仓库文件）：如需在论文中引用，确认其许可。
6. **归档状态守门**：8 项许可全部落定前，**Zenodo Deposit B 不得设为公开可下载**，
   归档保持「待发布」，DOI 占位符保持未回填。

> 所有条目的 SHA-256 均在 T01 由文件实际字节**重新计算**，见 `SHA256SUMS.txt`；
> 主仓库 `reference-provenance.json` 中记录的哈希仅作交叉参考，未被照抄。
> **本次未重算任何哈希、未改动任何数据文件字节**；`sha256sum -c SHA256SUMS.txt` 仍 9/9 OK。

---

## 7. 可执行再分发条件表（7 个需进一步确认「使用 / 再分发条件」的文件）

> 适用对象：`MANIFEST.json` 中 `license_decision = author_authorization_required` 的
> **7 个文件**（§0 #1–#7）。每行给出**权利方**、**条款依据 URL**、**是否允许公开再分发**、
> **具体还缺什么**、**建议动作**。缺什么一栏即「必须落实的那一件事」，不做模糊表述。
>
> 判定口径：「**需书面许可**」= 条款本身允许学术使用但再分发实质性数据子集需权利人书面授权；
> 「**否**」= 当前条款下不得公开再分发，只能替换为开放数据源。

| # | 文件路径 | 权利方 | 条款依据 URL | 是否允许公开再分发 | 具体还缺什么 | 建议动作 |
|---|---|---|---|---|---|---|
| 1 | `data/species/arabidopsis/Chr1.gff3.gz` | TAIR / Phoenix Bioinformatics（Araport11，AGI 等上游贡献者） | <https://phoenixbioinformatics.atlassian.net/wiki/spaces/COM/pages/42216430/TAIR+Terms+of+Use> | **需书面许可**（学术/非商业可用；再分发 substantial subset 须 Phoenix 书面许可） | 需 Phoenix Bioinformatics 就「在 Zenodo 公开再分发 Araport11 全量 Chr1 注释」出具**书面许可**；或改用开放替代源 | **申请许可**；若不成则**替换为 INSDC 开放数据**（NCBI RefSeq 染色体 CP002684，内容等价、无再分发限制） |
| 2 | `data/species/arabidopsis/Chr2.gff3.gz` | 同上 | 同上 | **需书面许可** | 同上（Chr2 对应 CP002685） | 同上 |
| 3 | `data/species/arabidopsis/Chr3.gff3.gz` | 同上 | 同上 | **需书面许可** | 同上（Chr3 对应 CP002686） | 同上 |
| 4 | `data/species/arabidopsis/Chr4.gff3.gz` | 同上 | 同上 | **需书面许可** | 同上（Chr4 对应 CP002687） | 同上 |
| 5 | `data/species/arabidopsis/Chr5.gff3.gz` | 同上 | 同上 | **需书面许可** | 同上（Chr5 对应 CP002688） | 同上 |
| 6 | `data/species/arabidopsis/TAIR10_genomic.fna.gz` | TAIR / AGI（经 Ensembl Plants r62 分发；Ensembl 仅对**自有**数据不作限制） | <https://www.ensembl.org/info/about/legal/disclaimer.html> | **需书面许可**（Ensembl disclaimer 明示第三方数据约束由用户自负，未授予再分发权） | 需 Phoenix/TAIR 就 TAIR10 组装序列的再分发出具**书面许可**；或改用 INSDC 的 TAIR10 染色体序列 | **申请许可**；若不成则**替换为 INSDC 开放数据**（RefSeq/GenBank CP002684–CP002688，序列等价） |
| 7 | `data/case-studies/arabidopsis-atlas/expression.tsv` | 数据所有者为 E-MTAB-7978 提交者（Mergner / Kuster, TUM）**及** EMBL-EBI（分发方） | <https://www.ebi.ac.uk/about/terms-of-use> | **需书面许可**（EBI 层「对贡献数据不额外加限制」已确证，但**记录中无 License 字段**，所有者许可缺省） | 需向 **E-MTAB-7978 数据所有者确认**是否允许再分发该 TPM 表；或由作者拍板按「EBI 无额外限制 + 引用 DOI 10.1038/s41586-020-2094-2 并标注 EBI 来源」使用 | **确认许可**（提交者 `julia.mergner@tum.de`）；补齐后**不再分发顾虑**，且**不改变文件字节** |

**表外说明（务必同时阅读）**：

1. **建议动作里的「替换」不是本机可执行的动作**。替换 6 个文件会改变 SHA-256 与字节数，
   进而改变 9 文件 / 68,518,847 B 基线、`SHA256SUMS.txt`、金标准测试基线、Figure 5(c)、
   补表 S1、论文 Data Availability 数字与 Zenodo Deposit B —— **必须由作者拍板后整体重跑**。
2. **第 7 项（#7）是 7 项里最容易闭环的**：只需一份所有者确认或作者一句拍板，**不动任何字节**。
3. **第 1–6 项的「需书面许可」不是「禁止使用」**：TAIR 条款允许学术/非营利使用与派生，
   受限的是**公开再分发实质性数据子集**——而 Zenodo 公开归档正是「公开再分发」，
   所以必须取得许可或替换。
4. **表中未列入**：
   - `data/species/mint/mentha_longifolia_horsemint.gff3.gz` —— 已确证 CC BY 4.0，可直接再分发（署名）；
   - `data/species/mint/mentha_longifolia_expression.tsv` —— 溯源已确证、许可未落定，
     处置为**不进公开包**（见 §5），不属于本表「申请许可 / 替换」二选一的场景。
5. **判定仍属保守**：本机无法核实「Zenodo 公开归档」是否落在各条款的「substantial subset」
   阈值内（该阈值条款未量化）。此处按最不利情形处理，宁严不宽。
