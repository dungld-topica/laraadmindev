<?php

namespace Illuminate\Pagination;

use Illuminate\Support\HtmlString;
use Illuminate\Contracts\Pagination\Paginator as PaginatorContract;
use Illuminate\Contracts\Pagination\Presenter as PresenterContract;
// DungLD
use Illuminate\Support\Str;

class BootstrapThreePresenter implements PresenterContract
{
    use BootstrapThreeNextPreviousButtonRendererTrait, UrlWindowPresenterTrait;

    /**
     * The paginator implementation.
     *
     * @var \Illuminate\Contracts\Pagination\Paginator
     */
    protected $paginator;

    // DungLD - Start
    protected $path;
    protected $perPage;
    // DungLD - End

    /**
     * The URL window data structure.
     *
     * @var array
     */
    protected $window;

    /**
     * Create a new Bootstrap presenter instance.
     *
     * @param  \Illuminate\Contracts\Pagination\Paginator  $paginator
     * @param  \Illuminate\Pagination\UrlWindow|null  $window
     * @return void
     */
    public function __construct(PaginatorContract $paginator, UrlWindow $window = null)
    {
        $this->paginator = $paginator;
        // DungLD - Start
        $this->path = UrlWindow::makePageSize($paginator);
        $this->perPage = UrlWindow::makePerPage($paginator);
        // DungLD - End
        $this->window = is_null($window) ? UrlWindow::make($paginator) : $window->get();
    }

    /**
     * Determine if the underlying paginator being presented has pages to show.
     *
     * @return bool
     */
    public function hasPages()
    {
        return $this->paginator->hasPages();
    }

    /**
     * Convert the URL window into Bootstrap HTML.
     *
     * @return \Illuminate\Support\HtmlString
     */
    public function render()
    {
        // DungLD - Start
        if ($this->hasPages()) {
            return new HtmlString(sprintf(
                '<div class="row rowPagination">
                            <div class="col-xs-3 col-md-3 colPageSize">
                                <label class="labelPageSize">Số bản ghi trên trang</label>
                                <select class="pagesize">%s</select>
                            </div>
                            <div class="col-xs-6 col-md-6 colPagination"><ul class="pagination">%s %s %s</ul></div>
                            <div class="col-xs-3 col-md-3"></div>
                        </div>',
                $this->getPageSize(),
                $this->getPreviousButton(),
                $this->getLinks(),
                $this->getNextButton()
            ));
        }

        return new HtmlString(sprintf(
            '<div class="row rowPagination">
                        <div class="col-xs-3 col-md-3 colPageSize">
                            <label class="labelPageSize">Số bản ghi trên trang</label>
                            <select class="pagesize">%s</select>
                        </div>
                        <div class="col-xs-6 col-md-6 colPagination"><ul class="pagination">%s %s %s</ul></div>
                        <div class="col-xs-3 col-md-3"></div>
                    </div>',
            $this->getPageSize(),
            $this->getPreviousButton(),
            $this->getLinks(),
            $this->getNextButton()
        ));
        // DungLD - End
        /*if ($this->hasPages()) {
            return new HtmlString(sprintf(
                '<ul class="pagination">%s %s %s</ul>',
                $this->getPreviousButton(),
                $this->getLinks(),
                $this->getNextButton()
            ));
        }

        return '';*/
    }

    // DungLD - Start
    public function getPageSize()
    {
        $html = '';

        for ($i = 1; $i <= 5; $i++) {
            $page_size = $i * 10;
            $url_pagesize = $this->urlPageSize($page_size);
            $selected = '';
            if ($this->perPage == $page_size) {
                $selected = ' selected';
            }
            $html .= '<option value="' . $page_size . '" data-url="' . $url_pagesize . '" ' . $selected . '>' . $page_size . '</option>';
        }

        return $html;
    }
    // DungLD - End

    // DungLD - Start
    public function urlPageSize($page_size)
    {
        $parameters = ['page' => 1, 'pagesize' => $page_size];

        return $this->path
            . (Str::contains($this->path, '?') ? '&' : '?')
            . http_build_query($parameters, '', '&');
    }
    // DungLD - End

    /**
     * Get HTML wrapper for an available page link.
     *
     * @param  string  $url
     * @param  int  $page
     * @param  string|null  $rel
     * @return string
     */
    protected function getAvailablePageWrapper($url, $page, $rel = null)
    {
        $rel = is_null($rel) ? '' : ' rel="'.$rel.'"';

        return '<li><a href="'.htmlentities($url).'"'.$rel.'>'.$page.'</a></li>';
    }

    /**
     * Get HTML wrapper for disabled text.
     *
     * @param  string  $text
     * @return string
     */
    protected function getDisabledTextWrapper($text)
    {
        return '<li class="disabled"><span>'.$text.'</span></li>';
    }

    /**
     * Get HTML wrapper for active text.
     *
     * @param  string  $text
     * @return string
     */
    protected function getActivePageWrapper($text)
    {
        return '<li class="active"><span>'.$text.'</span></li>';
    }

    /**
     * Get a pagination "dot" element.
     *
     * @return string
     */
    protected function getDots()
    {
        return $this->getDisabledTextWrapper('...');
    }

    /**
     * Get the current page from the paginator.
     *
     * @return int
     */
    protected function currentPage()
    {
        return $this->paginator->currentPage();
    }

    /**
     * Get the last page from the paginator.
     *
     * @return int
     */
    protected function lastPage()
    {
        return $this->paginator->lastPage();
    }
}
