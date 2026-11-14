# 溯源说明：`data/species/mint/mentha_longifolia_expression.tsv`（薄荷 4 叶 TPM 矩阵）

> 复核日期：**2026-11-14**（ISO-8601）。复核人：license-auditor。
> 本文件是**可复核的溯源记录**，只陈述本机可验证的事实链；不构成法律意见。
> 结论摘要：**来源已确证（可复现到命令与输入文件）；许可仍未落定**。因此该矩阵
> **不进入公开归档包**（见 §6），但**不再属于「来源无法确证」**，磁盘文件保留供内部复现。

---

## 1. 一句话结论

该矩阵**不是**从第三方下载的现成表达矩阵，而是**本项目作者在本机远程服务器上、用公开
INSDC/SRA 读段 + 本项目自身的 horsemint 注释，自行比对与定量计算出来的衍生数据**：

- **读段**：NCBI BioProject **SRP565976** 的 4 个 *Mentha longifolia* 叶片文库
  **SRR32469939 / SRR32469940 / SRR32469941 / SRR32469942**（基因型 **PI 557769**，
  即本套组装的同一份材料），经 ENA 镜像 `ftp.sra.ebi.ac.uk` 下载。
- **参考基因组**：本项目自建的 `Long3_HAP_v2` 单倍型 A、12 条染色体 FASTA
  （`mint_A.fa`），上游为 figshare **10.6084/m9.figshare.28457522**（**CC BY 4.0**）。
- **注释**：本仓库的 `data/species/mint/mentha_longifolia_horsemint.gff3.gz`
  （同一 figshare 条目，**CC BY 4.0**），经 `build_gtf.py` 转成 featureCounts 可读的 GTF。
- **算法**：`minimap2 -ax splice` → `featureCounts -s 0` → 自写 `make_tpm.py`
  （`rpk = count / (merged exon length / 1000)`，再按样本归一到 `1e6`）。

**因此原 `MANIFEST.json` 中的 `source_url`（figshare 基因组组装页）是错的**——那是
**上游基因组/注释**的页面，**不是本矩阵的来源**。本矩阵没有、也不可能有第三方下载页。
本次已把该字段更正为**实际下载读段所用的 ENA URL**，并保留原值于 `previous_source_url`。

---

## 2. 证据链（逐环节，含文件路径）

```
figshare 10.6084/m9.figshare.28457522 (CC BY 4.0)
  ├── Long3_HAP_v2.gtf.gz  ──build_mint_horsemint_gff3.py──▶  mentha_longifolia_horsemint.gff3.gz
  └── Long3_HAP_v2_genomic.fa.gz ──build_mint_genome_fasta.py──▶  mint_A.fa (Chr1–Chr12)
                                                                     │
mentha_longifolia_horsemint.gff3.gz ──build_gtf.py──▶ mint.gtf ───────┤
                                                                     ▼
NCBI SRP565976  SRR32469939/40/41/42  ──curl(ENA)──▶ sanitize_gz.py ──▶ minimap2 -ax splice
                                                                     ▼
                                                     samtools view -b -F 4 ──▶ featureCounts -s 0
                                                                     ▼
                                                          counts/Mlong_leaf_{1..4}.txt
                                                                     ▼
                                                            make_tpm.py  ──▶  本矩阵
```

### 2.1 环节 A — 输入读段（上游，公开）

| 项 | 值 | 可复核依据 |
|---|---|---|
| BioProject | **SRP565976** | 矩阵文件头第 2 行；`mint_expr/mint_rnaseq_samplesheet.tsv` |
| 文库 | SRR32469939 / 940 / 941 / 942 | `mint_expr/mint_rnaseq_samplesheet.tsv`（4 行，`Mentha longifolia` / `leaf` / `PI 557769`） |
| 下载 URL（实测可用） | `https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR324/039/SRR32469939/SRR32469939_1.fastq.gz`（其余三个 run 同构，尾号 040/041/042） | `mint_expr/run_longifolia.sh`、`mint_expr/download_reads.sh`、`mint_expr/refetch.sh` |
| 读段对 | 5,910,539 / 8,541,269 / 6,824,653 / 5,477,455 | `mint_expr/runs_full.tsv`（ENA 官方 run 统计）、`dist/薄荷完整数据/07_表达矩阵/README.md` 比对表 |
| 文件字节（R1/R2） | SRR32469939: 404,250,651 / 435,535,422 等 | `mint_expr/runs_full.tsv` |

> 上游读段的**归档属性**：INSDC/SRA/ENA 公开档案数据。**ENA/SRA 记录中没有 license 字段**
> （这是 INSDC 档案的既有设计，不是本项目遗漏）——所以「上游读段有明确再分发许可」这句话
> **无从确证**。这一点决定了 §6 的处置。

### 2.2 环节 B — 参考基因组（上游，CC BY 4.0）

- 文件 `mint_expr/genome/mint_A.fa`，374,019,843 B，**12 条**序列，表头
  `>Chr1 chromosome 1 Mentha longifolia` … `>Chr12 chromosome 12 Mentha longifolia`。
- 生成工具：`phytoscope/tools/build_mint_genome_fasta.py`（只取 A 单倍型 12 条，改表头）。
- 上游：figshare **10.6084/m9.figshare.28457522**（Lieberman, Henry & Comai 2025），
  **CC BY 4.0** —— 与本仓库已确证的 `mentha_longifolia_horsemint.gff3.gz` 同一许可、同一条目。

### 2.3 环节 C — 注释 → GTF（**关键对账点**）

- 工具：`mint_expr/build_gtf.py`。其输入路径**硬编码**为本项目 GFF3：
  `phytoscope/src/main/resources/data/species/mint/mentha_longifolia_horsemint.gff3`
  （即现本仓库 `data/species/mint/mentha_longifolia_horsemint.gff3.gz` 的解压内容）。
- 产物：`mint_expr/genome/mint.gtf`，48,829,703 B。

**已实测的对账（本次复核重跑，非引用旧记录）**：

| 断言 | 实测结果 |
|---|---|
| `mint.gtf` 唯一 `gene_id` 数 | **94,883** |
| 本仓库 `mentha_longifolia_horsemint.gff3.gz` 的 `gene` 行 ID 数 | **94,883** |
| 两者 ID 集合（去掉 `gene:` 前缀后）差异行数 | **0** |
| 矩阵数据行数（不含 7 行注释 + 1 行列名） | **94,883** |
| 矩阵 GeneID 集合与上述 ID 集合差异行数 | **0** |
| `mint.gtf` 特征行数 | 355,918 exon / 102,705 transcript |

> 即：**矩阵的基因 ID 与「本仓库 GFF3 的基因 ID」逐一对齐、零残差**。一个从第三方下载的
> 表达矩阵不可能出现这种对齐（本项目自己的调研记录也写明「无公开按 Long3_HAP_v2 基因号
> 定量的矩阵，外部矩阵必然 0 匹配」）。这是「本矩阵由本项目注释产出」的**决定性内证**。

### 2.4 环节 D — 比对与计数（取证命令）

最终生效脚本：`mint_expr/run_final.sh`（执行位置：远程 Linux 服务器
`/home/data/liangfei/WorkBuddy/mint_expr`）。核心命令逐字摘录：

```bash
# 1) 清洗（流式解压 + FASTQ 记录级校验），由 sanitize_gz.py 完成
python3 sanitize_gz.py fastq/Mlong_leaf_1_1.fastq.gz fastq/Mlong_leaf_1_1.clean.fq

# 2) 剪接感知比对（minimap2），丢弃未比对（-F 4）
minimap2 -ax splice -t 24 -k 14 --secondary=no --MD \
    "$M/genome/mint_A.fa" "$c1" "$c2" \
  | samtools view -b -F 4 - \
  | samtools sort -@ 4 -m 1G -o "$M/bam/${label}.r1.bam" -

# 3) 基因层级计数（featureCounts）。minimap2 不给 proper-pair 标志 → 单端模式，
#    每片段贡献 2 个计数；TPM 是比值，分子分母同倍放大，结果不受影响
featureCounts -T 8 -s 0 -a "$M/genome/mint.gtf" \
    -o "$M/counts/${label}.txt" "$M/bam/${label}.r1.bam"
```

`run_final.sh` 以 `xargs -P 4` 对 `Mlong_leaf_1..4` 四样本并行执行。

### 2.5 环节 E — TPM 计算与拼表

脚本：`mint_expr/make_tpm.py`。核心公式（与脚本 docstring 一致）：

```
rpk = count / (merged_exon_length / 1000)      # length 取 featureCounts 的合并外显子长度
tpm = rpk / (sum(rpk) / 1e6)
```

**已实测的内证**：本矩阵 4 列各自求和为

| 样本 | ΣTPM |
|---|---|
| `Mlong_leaf_1` | 1,000,000.00 |
| `Mlong_leaf_2` | 1,000,000.00 |
| `Mlong_leaf_3` | 1,000,000.00 |
| `Mlong_leaf_4` | 1,000,000.00 |

四列**精确归一到 1e6**，与 `make_tpm.py` 的算法定义完全吻合 —— 说明该文件确由这一算法产出，
而非任意转手矩阵。

### 2.6 环节 F — 字节级身份（最终闭环）

| 副本 | SHA-256 |
|---|---|
| `phytoscope-reference-data/data/species/mint/mentha_longifolia_expression.tsv` | `8000e27d6b37d695c62b2ce0d261b65ecf9eece171405b4815faf58b685ee7f1` |
| `dist/薄荷完整数据/07_表达矩阵/mint_expression_tpm.tsv`（交付给作者/软件的同一份） | `8000e27d6b37d695c62b2ce0d261b65ecf9eece171405b4815faf58b685ee7f1` |

两者**逐字节相同**，且与 `SHA256SUMS.txt` / `MANIFEST.json` 记录的哈希一致。

### 2.7 完整文件头（矩阵自带的溯源声明）

```text
# Mentha longifolia (Long3_HAP_v2, haplotype A) leaf transcriptome
# reads: NCBI BioProject SRP565976, 4 leaf libraries of PI 557769 (ENA mirror ftp.sra.ebi.ac.uk)
# alignment: minimap2 2.28 (-ax splice) against the Long3_HAP_v2 haplotype-A genome
# counts: featureCounts 2.0.6 at gene level on the PhytoScope GFF3 (94,883 genes)
# TPM: rpk = count / (merged exon length / 1000), then scaled to 1e6 per sample
# each fragment contributes two counts to its gene, so the ratio (TPM) is unaffected
# unit: TPM
```

> 工具版本（minimap2 2.28 / featureCounts 2.0.6）**取自矩阵头部与当时的工作日志**；
> `run_final.sh` 本身**未 pin 版本号**。复现时请以矩阵头部记录为准。

---

## 3. 复现步骤（照做即可，无需远程服务器凭据）

```bash
# 0. 取得权限内可用的读段（ENA 公开档案）
for r in 039/SRR32469939 040/SRR32469940 041/SRR32469941 042/SRR32469942; do
  id=${r#*/}; base=https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR324/$r/$id
  curl -sSLO "$base"_1.fastq.gz ; curl -sSLO "$base"_2.fastq.gz
done

# 1. 注释 → GTF（输入即本仓库的 GFF3）
zcat data/species/mint/mentha_longifolia_horsemint.gff3.gz > /tmp/horsemint.gff3
python3 mint_expr/build_gtf.py        # 脚本内硬编码 GFF/OUT 路径，按需改指向 /tmp
#   → 94,883 genes / 355,918 exons

# 2. 基因组（由 CC BY 4.0 上游重建）
python3 phytoscope/tools/build_mint_genome_fasta.py    # → 12 条染色体 mint_A.fa

# 3. 清洗 + 比对 + 计数（四样本）
bash mint_expr/sanitize_gz.py  # 每样本 R1/R2
bash mint_expr/run_final.sh    # minimap2 -ax splice → samtools -F 4 → featureCounts -s 0

# 4. TPM
python3 mint_expr/make_tpm.py counts/ mint_expression_tpm.tsv
sha256sum mint_expression_tpm.tsv
#   期望：8000e27d6b37d695c62b2ce0d261b65ecf9eece171405b4815faf58b685ee7f1
```

> **复现性边界（如实说明）**：逐字节复现 **TPM 数值**依赖 minimap2 / samtools / featureCounts
> / zlib 的**具体版本与线程设置**；本文记录的是产生该文件的**那一次**运行参数与工具版本。
> 换版本后基因 ID 集合、样本列、ΣTPM=1e6 等**结构性质**仍应成立，但个别基因的 TPM 末位
> 可能不同。**本文件不做「换任意环境必然逐字节一致」的承诺。**

---

## 4. 输入数据许可（逐项，与本仓库 `LICENSES.md` 口径一致）

| 输入 | 来源 | 许可 | 对公开再分发的影响 |
|---|---|---|---|
| 注释 GFF3（`horsemint.gff3.gz`） | figshare 10.6084/m9.figshare.28457522.v3 | **CC BY 4.0** | ✅ 允许再分发（署名）。上游无障碍 |
| 基因组 FASTA（`mint_A.fa`） | 同上 figshare 条目 | **CC BY 4.0** | ✅ 允许再分发（署名）。上游无障碍 |
| RNA-seq 读段（SRR32469939–942） | NCBI SRP565976 / ENA 镜像 | **无 license 字段（INSDC 档案惯例）** | ⚠️ **无法确证**存在明示再分发许可 |

补充说明：

1. 本项目**不转发任何原始读段**，只分发由读段计算得到的**逐基因 TPM 汇总值**（94,883 × 4 个
   统计量，不含序列、不含任何个体层面信息）。
2. 上游注释与基因组均为 **CC BY 4.0**，是本矩阵可被再分发的**最强依据**。
3. 唯一缺口是**读段层没有明示许可**。TPM 属高度汇总的衍生统计量，通常认为不构成对原始读段的
   再分发；但这是一个**需要作者/机构层面确认的判断**，本机**不代为下结论**，也**不臆造**。

---

## 5. 与旧文档的关系（更正记录）

| 旧表述 | 现状 | 处理 |
|---|---|---|
| `MANIFEST.json` `source_url` = `https://doi.org/10.6084/m9.figshare.28457522` | **错误**：该 DOI 是基因组组装页，文件清单中**没有**任何 TPM/表达矩阵 | 已更正为实际读段下载 URL；原值保留在 `previous_source_url` |
| `LICENSES.md` §5「来源与许可**均**无法确证」 | **部分过时**：来源已确证，仅许可未落定 | 已改写为「来源已确证 / 许可未落定」 |
| `license_status` / 「不得再分发」 | 仍然成立，且**理由更精确** | 保持 `needs_confirmation`；`distribution_status = withdrawn_from_public_deposit` |

> **未删除任何数据文件、未改动 `data/**` 任何字节、未改 `SHA256SUMS.txt`、未改 `totals`。**
> 本矩阵仍在仓库中、仍可被 CI 与本地复现引用，只是**不进入公开归档包**。

---

## 6. 处置：不进入公开归档包（理由与含义）

**结论**：`distribution_status = "withdrawn_from_public_deposit"`，
`license_decision = "withdrawn_pending_upstream_confirmation"`，`author_action_required = "A4"`。

**理由**（按保守原则，逐条对应 §4 的缺口）：

1. 上游读段层**无明示许可**，公开再分发「是否合规」无法由本机确证；
2. 「无法确证」时不公开再分发，是既定且一贯的处置原则（与其余 7 项同标准）；
3. 但它与另外 7 项**性质不同**：来源已可复现，**不需要作者"追根"**，只需**确认一个许可问题**。

**「不进入公开归档包」的确切含义**（务必按此表述对外）：

- 该文件**仍保留**在 `phytoscope-reference-data` 仓库中（供内部复现与审计）；
- 该文件**不作为** Zenodo Deposit B 公开归档包的组成部分 → Deposit B 公开包为
  **8 个数据文件 / 65,124,010 B**（= 68,518,847 − 3,394,837）；
- `MANIFEST.json` 的 `totals` 仍为 **9 / 68,518,847**、`SHA256SUMS.txt` 仍为 **9 行**
  —— 因为仓库内容未变，变的只是「哪些进公开包」；
- 论文/软件侧对「9 个文件 / 68,518,847 B / 9/9 OK」的表述**依然属实**（这是仓库口径），
  但**不得**据此声称「9 个文件都可公开下载」。

---

## 7. 仍需作者执行（A4）

1. **向 SRP565976 的提交者确认**：是否允许将「基于该读段计算的逐基因 TPM 汇总值」在数据归档中
   公开再分发（建议同时说明：不含原始读段、上游注释与基因组均为 CC BY 4.0）。
2. **或**拍板按「仅分发汇总统计量 + 完整引用 SRP565976 + 标注 CC BY 4.0 上游」处理，
   由作者/机构承担该判断。
3. **或**拍板维持现状（不进公开包），则 Deposit B 永为 8 个文件。
4. 无论哪种结论，**都不要再把 figshare 组装页当作本矩阵的 `source_url`**。
